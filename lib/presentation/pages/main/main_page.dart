import 'dart:developer';

import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:uniguard_z/presentation/enums/drawer_page.dart';
import 'package:uniguard_z/presentation/extensions/build_context_extension.dart';
import 'package:uniguard_z/presentation/misc/app_routes.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';
import 'package:uniguard_z/presentation/misc/utils.dart';
import 'package:uniguard_z/presentation/pages/main/sections/activities_section.dart';
import 'package:uniguard_z/presentation/pages/main/sections/forms_section.dart';
import 'package:uniguard_z/presentation/pages/main/sections/history_section.dart';
import 'package:uniguard_z/presentation/pages/main/sections/home_section.dart';
import 'package:uniguard_z/presentation/pages/main/sections/scan_section.dart';
import 'package:uniguard_z/presentation/pages/main/sections/settings_section.dart';
import 'package:uniguard_z/presentation/pages/main/sections/tasks_section.dart';
import 'package:uniguard_z/presentation/providers/common/page_provider.dart';
import 'package:uniguard_z/presentation/providers/routes/router_provider.dart';
import 'package:uniguard_z/presentation/providers/user_data/user_data_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    startBackgroundService();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  void startBackgroundService() async {
    log("start location service");
    await BackgroundLocation.setAndroidNotification(
        title: "Background location is running",
        message: "Background location in progress",
        icon: "@mipmap/ic_launcher");
    // BackgroundLocation.stopLocationService();
    await BackgroundLocation.startLocationService(distanceFilter: 10);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedPage = ref.watch(pageProvider);

    ref.listen(
      userDataProvider,
      (previous, next) {
        if (previous != null && next is AsyncData && next.value == null) {
          BackgroundLocation.stopLocationService();
          ref.read(routerProvider).go(Routes.LOGIN);
        } else if (next is AsyncError) {
          context.showSnackBar(next.error.toString());
        }
      },
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedPage.title),
          scrolledUnderElevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.cloud_upload,
                size: 24,
              ),
            ),
          ],
          bottom: selectedPage == DrawerPage.history
              ? TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(text: "Uploaded"),
                    Tab(text: "Pending"),
                  ],
                  indicatorColor: AppColors.secondarySoft,
                )
              : null,
        ),
        drawer: _buildDrawer(context),
        body: selectedPage == DrawerPage.history
            ? const TabBarView(
                children: [
                  Center(child: Text("Content for Uploaded")),
                  Center(child: Text("Content for Pending")),
                ],
              )
            : _buildContent(selectedPage),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final user = ref.watch(userDataProvider).valueOrNull;
    final userName = user?.name ?? "-";
    final userEmail = user?.email ?? "No email";
    final userInitial = userName.isNotEmpty ? userName[0].toUpperCase() : "-";

    final selectedPage = ref.watch(pageProvider); // Memantau page aktif

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 42, 164, 226),
              child: Text(
                userInitial,
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(color: AppColors.secondaryExtraSoft),
            accountName: Text(
              userName,
              style: Typogaphy.SemiBold.copyWith(
                color: AppColors.dark,
              ),
            ),
            accountEmail: Text(
              userEmail,
              style: Typogaphy.Regular.copyWith(
                color: AppColors.dark,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text('Home'.toUpperCase()),
            selected: selectedPage == DrawerPage.home,
            selectedTileColor: AppColors.primarySoft,
            onTap: () {
              ref.read(pageProvider.notifier).state = DrawerPage.home;
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.wifi_tethering),
            title: Text('Scan'.toUpperCase()),
            selected: selectedPage == DrawerPage.scan,
            selectedTileColor: AppColors.primarySoft,
            onTap: () async {
              bool isAvailable = await NfcManager.instance.isAvailable();
              printIfDebug(isAvailable);
              if (isAvailable) {
                ref.read(pageProvider.notifier).state = DrawerPage.scan;
              } else {
                if (context.mounted) {
                  context.showSnackBar("your device not support NFC.");
                }
              }
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.report_problem),
            title: Text('Alarm'.toUpperCase()),
            selected: selectedPage == DrawerPage.alarm,
            selectedTileColor: AppColors.primarySoft,
            onLongPress: () {
              Future.delayed(const Duration(seconds: 3), () {
                context.showSnackBar("Alarm has been triggered");
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: Text('Forms'.toUpperCase()),
            selected: selectedPage == DrawerPage.forms,
            selectedTileColor: AppColors.primarySoft,
            onTap: () {
              ref.read(pageProvider.notifier).state = DrawerPage.forms;
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.check_circle),
            title: Text('Tasks'.toUpperCase()),
            selected: selectedPage == DrawerPage.tasks,
            selectedTileColor: AppColors.primarySoft,
            onTap: () {
              ref.read(pageProvider.notifier).state = DrawerPage.tasks;
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_activity),
            title: Text('Activity Log'.toUpperCase()),
            selected: selectedPage == DrawerPage.activityLog,
            selectedTileColor: AppColors.primarySoft,
            onTap: () {
              ref.read(pageProvider.notifier).state = DrawerPage.activityLog;
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.restore),
            title: Text('History'.toUpperCase()),
            selected: selectedPage == DrawerPage.history,
            selectedTileColor: AppColors.primarySoft,
            onTap: () {
              ref.read(pageProvider.notifier).state = DrawerPage.history;
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('Settings'.toUpperCase()),
            selected: selectedPage == DrawerPage.settings,
            selectedTileColor: AppColors.primarySoft,
            onTap: () {
              ref.read(pageProvider.notifier).state = DrawerPage.settings;
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text('Logout'.toUpperCase()),
            onTap: () {
              ref.read(userDataProvider.notifier).logout();
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          const Divider(),
          ListTile(
            title: Text(
              'Version',
              style: Typogaphy.Regular,
            ),
            subtitle: Text(
              _packageInfo.version,
              style: Typogaphy.Regular,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(DrawerPage selectedPage) {
    switch (selectedPage) {
      case DrawerPage.home:
        return const HomeSection();
      case DrawerPage.scan:
        return const ScanSection();
      case DrawerPage.forms:
        return const FormsSection();
      case DrawerPage.tasks:
        return const TasksSection();
      case DrawerPage.activityLog:
        return const ActivitiesSection();
      case DrawerPage.history:
        return const HistorySection();
      case DrawerPage.settings:
        return const SettingsSection();
      default:
        return const HomeSection();
    }
  }
}
