import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/domain/entities/activity.dart';
import 'package:uniguard_z/domain/entities/branch.dart';
import 'package:uniguard_z/domain/entities/task.dart';
import 'package:uniguard_z/presentation/misc/app_routes.dart';
import 'package:uniguard_z/presentation/pages/activity/activity_page.dart';
import 'package:uniguard_z/presentation/pages/change_password/change_password_page.dart';
import 'package:uniguard_z/presentation/pages/profile/profile_page.dart';
import 'package:uniguard_z/presentation/pages/form/form_page.dart';
import 'package:uniguard_z/presentation/pages/login/login_page.dart';
import 'package:uniguard_z/presentation/pages/main/main_page.dart';
import 'package:uniguard_z/presentation/pages/maps/maps_page.dart';
import 'package:uniguard_z/presentation/pages/splash/splash_page.dart';
import 'package:uniguard_z/presentation/pages/task/task_page.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      routes: [
        GoRoute(
          path: Routes.SPLASH,
          name: "/",
          builder: (context, state) {
            return const SplashPage();
          },
        ),
        GoRoute(
          path: Routes.LOGIN,
          name: "login",
          builder: (context, state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: Routes.MAIN,
          name: "main",
          builder: (context, state) {
            return const MainPage();
          },
        ),
        GoRoute(
          path: Routes.FORM,
          name: "form",
          builder: (context, state) {
            return FormPage(branch: state.extra as Branch);
          },
        ),
        GoRoute(
          path: Routes.TASK,
          name: "task",
          builder: (context, state) {
            return TaskPage(task: state.extra as Task);
          },
        ),
        GoRoute(
          path: Routes.ACTIVITY,
          name: "activity",
          builder: (context, state) {
            return ActivityPage(activity: state.extra as Activity);
          },
        ),
        GoRoute(
          path: Routes.MAPS,
          name: "maps",
          builder: (context, state) {
            return MapsPage(coordinate: state.extra as LatLng?);
          },
        ),
        GoRoute(
          path: Routes.PROFILE,
          name: "edit-profile",
          builder: (context, state) {
            return const ProfilePage();
          },
        ),
        GoRoute(
          path: Routes.CHANGE_PASSWORD,
          name: "change-password",
          builder: (context, state) {
            return const ChangePasswordPage();
          },
        )
      ],
      initialLocation: Routes.SPLASH,
      debugLogDiagnostics: false,
    );
