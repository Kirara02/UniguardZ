import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniguard_z/presentation/misc/app_routes.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/providers/routes/router_provider.dart';

class SettingsSection extends ConsumerWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        ListTile(
          title: const Text("Edit Profile"),
          leading: Icon(
            Icons.person_rounded,
            color: AppColors.grey,
          ),
          onTap: () => ref.read(routerProvider).push(Routes.EDIT_PROFILE),
        ),
        ListTile(
          title: const Text("Change Password"),
          leading: Icon(
            Icons.lock_rounded,
            color: AppColors.grey,
          ),
          onTap: () => ref.read(routerProvider).push(Routes.CHANGE_PASSWORD),
        )
      ],
    );
  }
}
