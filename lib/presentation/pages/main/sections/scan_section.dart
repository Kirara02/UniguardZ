import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';

class ScanSection extends ConsumerWidget {
  const ScanSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.wifi_tethering,
              size: 84,
              color: AppColors.secondary,
            ),
            const SizedBox(height: 12),
            Text(
              "Hold your device near an NFC\ncheckpoint to scan",
              textAlign: TextAlign.center,
              style: Typogaphy.Medium.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
