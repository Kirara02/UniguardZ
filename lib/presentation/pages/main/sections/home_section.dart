import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeSection extends ConsumerStatefulWidget {
  const HomeSection({super.key});

  @override
  ConsumerState<HomeSection> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomeSection> {
  // String? _mapStyleString;
  //
  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();
  //
  // LatLng? _currentLatLng;
  //
  // Set<Marker> _markers = {};
  // BitmapDescriptor? _customIcon;
  //
  // static const CameraPosition _initialCameraPosition = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 15,
  // );

  @override
  void initState() {
    super.initState();

    // Load map style
    // rootBundle.loadString('assets/map/map_style.json').then((string) {
    //   setState(() {
    //     _mapStyleString = string;
    //   });
    // });

    // _loadCustomMarkerIcon();
    // getBackgroundLocation();
  }

  // void getBackgroundLocation() {
  //   BackgroundLocation.getLocationUpdates((location) {
  //     printIfDebug(location.toMap());
  //     LatLng newLocation = LatLng(location.latitude!, location.longitude!);
  //
  //     setState(() {
  //       _currentLatLng = newLocation;
  //
  //       _markers = {
  //         Marker(
  //           icon: _customIcon ?? BitmapDescriptor.defaultMarker,
  //           markerId: const MarkerId("currentLocation"),
  //           position: newLocation,
  //           infoWindow: const InfoWindow(title: "Current Location"),
  //         ),
  //       };
  //     });
  //
  //     // Pindahkan kamera ke lokasi terbaru
  //     _moveCameraToLocation(newLocation);
  //   });
  // }

  // Fungsi untuk memuat ikon marker dari assets
  // Future<void> _loadCustomMarkerIcon() async {
  //   _customIcon = await BitmapDescriptor.asset(
  //     const ImageConfiguration(size: Size(48, 48)),
  //     'assets/images/location_red.png',
  //   );
  // }

  // Fungsi untuk memindahkan kamera ke lokasi terbaru
  // Future<void> _moveCameraToLocation(LatLng newLocation) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newLatLng(newLocation));
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.welcomeMessage,
              style: Typogaphy.Medium.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
