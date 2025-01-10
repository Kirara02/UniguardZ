import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uniguard_z/presentation/extensions/build_context_extension.dart';
import 'package:uniguard_z/presentation/misc/app_routes.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/screen.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';
import 'package:uniguard_z/presentation/providers/common/locale_provider.dart';
import 'package:uniguard_z/presentation/providers/common/theme_provider.dart';
import 'package:uniguard_z/presentation/providers/routes/router_provider.dart';
import 'package:uniguard_z/presentation/providers/user_data/user_data_provider.dart';
import 'package:uniguard_z/presentation/widgets/common/custom_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeNotifier = ref.read(localeProvider.notifier);
    final themeRef = ref.watch(appThemeProvider);
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    final List<SettingGroup> _settingItems = [
      SettingGroup(
        title: AppLocalizations.of(context)!.general,
        items: [
          SettingItem(
            text: AppLocalizations.of(context)!.language,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                builder: (context) {
                  final currentLocale = ref.watch(localeProvider);

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.choose_language,
                          style: context.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListTile(
                          title: const Text("English"),
                          trailing: currentLocale?.languageCode == 'en'
                              ? const Icon(Icons.check, color: Colors.blue)
                              : null,
                          onTap: () {
                            localeNotifier.setLocale(const Locale("en"));
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text("Bahasa Indonesia"),
                          trailing: currentLocale?.languageCode == 'id'
                              ? const Icon(Icons.check, color: Colors.blue)
                              : null,
                          onTap: () {
                            localeNotifier.setLocale(const Locale("id"));
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      SettingGroup(
        title: AppLocalizations.of(context)!.account,
        items: [
          SettingItem(
            text: AppLocalizations.of(context)!.change_profile,
            onPressed: () => ref.read(routerProvider).push(Routes.PROFILE),
          ),
          SettingItem(
            text: AppLocalizations.of(context)!.change_password,
            onPressed: () =>
                ref.read(routerProvider).push(Routes.CHANGE_PASSWORD),
          ),
          SettingItem(
            text: AppLocalizations.of(context)!.logout,
            onPressed: () => ref.read(userDataProvider.notifier).logout(),
          ),
        ],
      ),
    ];

    return Scaffold(
      body: CustomView(
        header: Container(
          height: AppScreens.height * 0.1,
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 0),
          child: Row(
            children: [
              IconButton(
                onPressed: () => ref.read(routerProvider).pop(),
                icon: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  size: 20,
                  color: AppColors.light,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context)!.settings,
                style: textTheme.titleSmall?.copyWith(
                  color: AppColors.light,
                ),
              ),
              const Spacer(),
              Switch(
                value: themeRef.isDarkMode,
                onChanged: (_) {
                  ref.read(appThemeProvider).toggleTheme();
                },
                activeThumbImage:
                    const AssetImage('assets/images/full_moon.png'),
                inactiveThumbImage: const AssetImage('assets/images/sun.png'),
                activeColor: AppColors.primaryExtraSoft,
                activeTrackColor: AppColors.primaryExtraSoft,
                inactiveTrackColor: AppColors.secondaryExtraSoft,
                inactiveThumbColor: AppColors.secondaryExtraSoft,
                trackOutlineColor: WidgetStatePropertyAll(colorScheme.tertiary),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
          itemCount: _settingItems.length,
          itemBuilder: (context, index) {
            var item = _settingItems[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Typogaphy.Bold.copyWith(
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 12,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: item.items
                        .map(
                          (i) => InkWell(
                            onTap: () => i.onPressed(),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.7),
                                    width: 0.7,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    i.text,
                                    style:
                                        Typogaphy.Medium.copyWith(fontSize: 12),
                                  ),
                                  const FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    size: 12,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class SettingGroup {
  final String title;
  final List<SettingItem> items;

  SettingGroup({required this.title, required this.items});
}

class SettingItem {
  final String text;
  final Function() onPressed;

  SettingItem({required this.text, required this.onPressed});
}
