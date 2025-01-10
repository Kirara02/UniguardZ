import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uniguard_z/presentation/extensions/build_context_extension.dart';
import 'package:uniguard_z/presentation/misc/app_routes.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/screen.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';
import 'package:uniguard_z/presentation/pages/main/sections/history_section.dart';
import 'package:uniguard_z/presentation/pages/main/sections/home_section.dart';
import 'package:uniguard_z/presentation/providers/routes/router_provider.dart';
import 'package:uniguard_z/presentation/providers/user_data/user_data_provider.dart';
import 'package:uniguard_z/presentation/widgets/common/custom_view.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int _currentPage = 0;

  final List<Widget> _pages = [
    const HomeSection(),
    const HistorySection(),
  ];

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (previous != null && next is AsyncData && next.value == null) {
          ref.read(routerProvider).go(Routes.LOGIN);
        } else if (next is AsyncError) {
          context.showSnackBar(next.error.toString());
        }
      },
    );

    return Scaffold(
      body: CustomView(
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
        body: IndexedStack(
          index: _currentPage,
          children: _pages,
        ),
      ),
      backgroundColor: context.colorScheme.surfaceContainer,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => ref.read(routerProvider).push(Routes.SCAN),
        backgroundColor: context.colorScheme.primary,
        child: SvgPicture.asset(
          "assets/icons/scan.svg",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: BottomAppBar(
          elevation: 3,
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          padding: EdgeInsets.zero,
          height: kBottomNavigationBarHeight,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: context.colorScheme.surface,
            elevation: 0,
            selectedIconTheme:
                IconThemeData(color: context.colorScheme.onSurface),
            selectedItemColor: context.colorScheme.onSurface,
            unselectedItemColor: context.colorScheme.onSurface,
            unselectedLabelStyle: Typogaphy.Regular.copyWith(fontSize: 12),
            selectedLabelStyle: Typogaphy.Medium.copyWith(fontSize: 12),
            currentIndex: _currentPage,
            onTap: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/home.png",
                  width: 24,
                  color: AppColors.secondary,
                ),
                activeIcon: Image.asset(
                  "assets/images/home_active.png",
                  width: 24,
                  color: AppColors.secondary,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/histories.png",
                  width: 24,
                  color: AppColors.secondary,
                ),
                activeIcon: Image.asset(
                  "assets/images/histories_active.png",
                  width: 24,
                  color: AppColors.secondary,
                ),
                label: "History",
              )
            ],
          ),
        ),
      ),
    );
  }
}
