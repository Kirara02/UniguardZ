import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/domain/entities/activity.dart';
import 'package:uniguard_z/domain/entities/branch.dart';
import 'package:uniguard_z/domain/entities/task.dart';
import 'package:uniguard_z/presentation/misc/app_routes.dart';
import 'package:uniguard_z/presentation/pages/activity/activity_page.dart';
import 'package:uniguard_z/presentation/pages/activity_log/activity_log_page.dart';
import 'package:uniguard_z/presentation/pages/change_password/change_password_page.dart';
import 'package:uniguard_z/presentation/pages/forms/forms_page.dart';
import 'package:uniguard_z/presentation/pages/profile/profile_page.dart';
import 'package:uniguard_z/presentation/pages/form/form_page.dart';
import 'package:uniguard_z/presentation/pages/login/login_page.dart';
import 'package:uniguard_z/presentation/pages/main/main_page.dart';
import 'package:uniguard_z/presentation/pages/maps/maps_page.dart';
import 'package:uniguard_z/presentation/pages/scan/scan_page.dart';
import 'package:uniguard_z/presentation/pages/settings/settings_page.dart';
import 'package:uniguard_z/presentation/pages/splash/splash_page.dart';
import 'package:uniguard_z/presentation/pages/task/task_page.dart';
import 'package:uniguard_z/presentation/pages/tasks/tasks_page.dart';

part 'router_provider.g.dart';

Page<dynamic> _buildPageWithSlideTransition(
    BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        )),
        child: child,
      );
    },
  );
}

Page<dynamic> _buildPageWithFadeInOutTransition(
    BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        ),
        child: child,
      );
    },
  );
}

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      routes: [
        GoRoute(
          path: Routes.SPLASH,
          name: "/",
          pageBuilder: (context, state) {
            return _buildPageWithFadeInOutTransition(
              context,
              state,
              const SplashPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.LOGIN,
          name: "login",
          pageBuilder: (context, state) {
            return _buildPageWithFadeInOutTransition(
              context,
              state,
              const LoginPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.MAIN,
          name: "main",
          pageBuilder: (context, state) {
            return _buildPageWithFadeInOutTransition(
              context,
              state,
              const MainPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.SCAN,
          name: "scan",
          pageBuilder: (context, state) {
            return _buildPageWithFadeInOutTransition(
              context,
              state,
              const ScanPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.FORMS,
          name: "forms",
          pageBuilder: (context, state) {
            return _buildPageWithFadeInOutTransition(
              context,
              state,
              const FormsPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.TASKS,
          name: "tasks",
          pageBuilder: (context, state) {
            return _buildPageWithFadeInOutTransition(
              context,
              state,
              const TasksPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.ACTIVITIES,
          name: "activities",
          pageBuilder: (context, state) {
            return _buildPageWithFadeInOutTransition(
              context,
              state,
              const ActivityLogPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.FORM,
          name: "form",
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context,
              state,
              FormPage(branch: state.extra as Branch),
            );
          },
        ),
        GoRoute(
          path: Routes.TASK,
          name: "task",
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context,
              state,
              TaskPage(task: state.extra as Task),
            );
          },
        ),
        GoRoute(
          path: Routes.ACTIVITY,
          name: "activity",
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context,
              state,
              ActivityPage(activity: state.extra as Activity),
            );
          },
        ),
        GoRoute(
          path: Routes.MAPS,
          name: "maps",
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context,
              state,
              MapsPage(coordinate: state.extra as LatLng?),
            );
          },
        ),
        GoRoute(
          path: Routes.PROFILE,
          name: "edit-profile",
          pageBuilder: (context, state) {
            return _buildPageWithFadeInOutTransition(
              context,
              state,
              const ProfilePage(),
            );
          },
        ),
        GoRoute(
          path: Routes.SETTINGS,
          name: "settings",
          pageBuilder: (context, state) {
            return _buildPageWithFadeInOutTransition(
              context,
              state,
              const SettingsPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.CHANGE_PASSWORD,
          name: "change-password",
          pageBuilder: (context, state) {
            return _buildPageWithFadeInOutTransition(
              context,
              state,
              const ChangePasswordPage(),
            );
          },
        ),
      ],
      initialLocation: Routes.SPLASH,
      debugLogDiagnostics: false,
    );
