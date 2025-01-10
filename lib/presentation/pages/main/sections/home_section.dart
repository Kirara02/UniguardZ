import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniguard_z/presentation/extensions/build_context_extension.dart';
import 'package:uniguard_z/presentation/misc/app_routes.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/providers/routes/router_provider.dart';

class HomeSection extends ConsumerWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = context.colorScheme;

    final List<MenuItem> menuItems = [
      MenuItem(
        iconPath: "assets/images/alarm.png",
        label: 'Alarm',
        isLongPress: true,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Alarm triggered!'),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
      MenuItem(
        iconPath: "assets/images/forms.png",
        label: 'Forms',
        onPressed: () => ref.read(routerProvider).push(Routes.FORMS),
      ),
      MenuItem(
        iconPath: "assets/images/tasks.png",
        label: 'Tasks',
        onPressed: () => ref.read(routerProvider).push(Routes.TASKS),
      ),
      MenuItem(
        iconPath: "assets/images/online-activity.png",
        label: 'Activity Log',
        onPressed: () => ref.read(routerProvider).push(Routes.ACTIVITIES),
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Latest Activity",
                    style: context.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 36,
                          height: 36,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Form - School Form 1",
                            style: context.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // const SizedBox(height: 4),
                          Text(
                            "Today, 10:00 am",
                            style: context.textTheme.labelSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.hint,
                            ),
                          )
                        ],
                      )
                    ],
                  )
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
                  onTap: item.isLongPress == false ? item.onPressed : null,
                  onLongPress: item.isLongPress == true ? item.onPressed : null,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: colorScheme.surfaceBright,
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.outline.withOpacity(0.5),
                          spreadRadius: 1.5,
                          blurRadius: 2,
                          offset: const Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item.iconPath,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.label,
                          style: context.textTheme.labelMedium!.copyWith(
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
    );
  }
}

class MenuItem {
  final String iconPath;
  final String label;
  final bool? isLongPress;
  final VoidCallback? onPressed;

  MenuItem(
      {required this.iconPath,
      required this.label,
      this.isLongPress = false,
      this.onPressed});
}
