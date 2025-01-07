import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uniguard_z/presentation/misc/app_routes.dart';
import 'package:uniguard_z/presentation/misc/screen.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';
import 'package:uniguard_z/presentation/providers/routes/router_provider.dart';
import 'package:uniguard_z/presentation/providers/user_data/user_data_provider.dart';
import 'package:uniguard_z/presentation/widgets/common/custom_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeSection extends ConsumerWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userDataProvider).valueOrNull;
    final colorScheme = Theme.of(context).colorScheme;

    final List<MenuItem> menuItems = [
      MenuItem(
          icon: FontAwesomeIcons.triangleExclamation,
          label: 'Alarm',
          routes: Routes.SCAN),
      MenuItem(
          icon: FontAwesomeIcons.barsProgress,
          label: 'Forms',
          routes: Routes.FORMS),
      MenuItem(
          icon: FontAwesomeIcons.listCheck,
          label: 'Tasks',
          routes: Routes.TASKS),
      MenuItem(
          icon: FontAwesomeIcons.clockRotateLeft,
          label: 'Activity Log',
          routes: Routes.ACTIVITIES),
    ];

    Widget _buildTaskRow({
      required String label,
      required String value,
      required IconData icon,
      required double progress,
    }) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: Icon(icon, size: 16, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: Typogaphy.Regular.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: Typogaphy.SemiBold.copyWith(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.green),
                      minHeight: 6,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return CustomView(
      header: Container(
        height: AppScreens.height * 0.1,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/login_logo.png",
              width: 120,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    ref.read(routerProvider).push(Routes.SETTINGS);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.gear,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(userDataProvider.notifier).logout();
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowRightFromBracket,
                    size: 20,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            /// USER INFO
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Row(
                children: [
                  ClipOval(
                    child: user != null
                        ? CachedNetworkImage(
                            imageUrl:
                                "https://ui-avatars.com/api/?name=${user.name}",
                            fit: BoxFit.cover,
                            height: 36,
                            width: 36,
                          )
                        : Container(
                            height: 36,
                            width: 36,
                            color: colorScheme.surface,
                          ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcome,
                        style: Typogaphy.Regular,
                      ),
                      Text(
                        "${user?.name}",
                        style: Typogaphy.SemiBold,
                      )
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade400, Colors.blue.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primaryContainer.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Text(
                        "Daily Resume",
                        style: Typogaphy.Medium.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                      child: Column(
                        children: [
                          _buildTaskRow(
                            label: "Completed",
                            value: "15",
                            icon: Icons.check_circle,
                            progress: 1.0, // Full progress
                          ),
                          _buildTaskRow(
                            label: "Forms Planned",
                            value: "8/10",
                            icon: Icons.article,
                            progress: 0.8,
                          ),
                          _buildTaskRow(
                            label: "Tasks Planned",
                            value: "4/7",
                            icon: Icons.task,
                            progress: 0.57,
                          ),
                          _buildTaskRow(
                            label: "Activity Planned",
                            value: "3/5",
                            icon: Icons.event,
                            progress: 0.6,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 28,
                  mainAxisSpacing: 24,
                  childAspectRatio: 1.5,
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return GestureDetector(
                    onTap: () => ref.read(routerProvider).push(item.routes),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: colorScheme.surfaceBright,
                        // border: Border.all(
                        //   color: colorScheme.outline.withOpacity(0.5),
                        // ),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.error.withOpacity(0.6),
                            spreadRadius: 1.5,
                            blurRadius: 2,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            item.icon,
                            size: 42,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.label,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final IconData icon;
  final String label;
  final String routes;

  MenuItem({required this.icon, required this.label, required this.routes});
}
