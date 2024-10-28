import 'dart:developer';

import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uniguard_z/presentation/misc/app_routes.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniguard_z/presentation/misc/utils.dart';
import 'package:uniguard_z/presentation/providers/routes/router_provider.dart';
import 'package:uniguard_z/presentation/providers/user_data/user_data_provider.dart';

class HomeSection extends ConsumerStatefulWidget {
  const HomeSection({super.key});

  @override
  ConsumerState<HomeSection> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomeSection> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.dark,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.welcomeMessage,
                      style: Typogaphy.Regular.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ref.watch(userDataProvider).valueOrNull?.name ?? "-",
                      style: Typogaphy.Medium,
                    )
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                child: InkWell(
                  onTap: () async {
                    LatLng? _latLng;

                    if (await BackgroundLocation.isServiceRunning()) {
                      BackgroundLocation.getLocationUpdates((value) {
                        printIfDebug("position: $value");
                        setState(() {
                          _latLng = LatLng(value.latitude!, value.longitude!);
                        });
                      });
                      printIfDebug("latlng: $_latLng");
                    }
                    ref.read(routerProvider).push(Routes.MAPS, extra: _latLng);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "View current position",
                        style: Typogaphy.Medium.copyWith(
                          color: AppColors.secondaryExtraSoft,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.secondaryExtraSoft,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
