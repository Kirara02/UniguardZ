import 'dart:async';
import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uniguard_z/presentation/misc/utils.dart';

class MapsPage extends ConsumerStatefulWidget {
  final LatLng? coordinate;
  const MapsPage({super.key, this.coordinate});

  @override
  ConsumerState createState() => _MapsPageState();
}

class _MapsPageState extends ConsumerState<MapsPage> {
  String? _mapStyleString;

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  LatLng? _currentLatLng;

  Set<Marker> _markers = {};
  BitmapDescriptor? _customIcon;

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 15,
  );

  @override
  void initState() {
    super.initState();

    // Load map style
    rootBundle.loadString('assets/map/map_style.json').then((string) {
      setState(() {
        _mapStyleString = string;
      });
    });

    _loadCustomMarkerIcon();

    if (widget.coordinate != null) {
      _setMarkerAndMoveCamera(widget.coordinate!);
    } else {
      getBackgroundLocation();
    }
  }

  void getBackgroundLocation() {
    BackgroundLocation.getLocationUpdates((location) {
      LatLng newLocation = LatLng(location.latitude!, location.longitude!);

      if (widget.coordinate == null) {
        setState(() {
          _currentLatLng = newLocation;
        });
        _setMarkerAndMoveCamera(newLocation);
      }
    });
  }

  Future<void> _loadCustomMarkerIcon() async {
    _customIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)), // Ukuran ikon
      'assets/images/location_red.png', // Lokasi aset
    );
  }

  void _setMarkerAndMoveCamera(LatLng position) {
    printIfDebug("position: ${position}");
    setState(() {
      _currentLatLng = position;
      _markers = {
        Marker(
          icon: _customIcon ?? BitmapDescriptor.defaultMarker,
          markerId: const MarkerId("currentLocation"),
          position: position,
          infoWindow: const InfoWindow(title: "Current Location"),
        ),
      };
    });
    _moveCameraToLocation(position);
  }

  Future<void> _moveCameraToLocation(LatLng newLocation) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(newLocation));
  }

  @override
  Widget build(BuildContext context) {
    printIfDebug("coordinate: ${widget.coordinate}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Location"),
      ),
      body: Center(
        child: GoogleMap(
          mapType: MapType.normal,
          style: _mapStyleString,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) {
            _controller.complete(controller);
            if (_currentLatLng != null) {
              _moveCameraToLocation(_currentLatLng!);
            }
          },
          markers: _markers,
        ),
      ),
    );
  }
}
