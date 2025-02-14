import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/entities/user.dart';
import 'package:uniguard_z/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:uniguard_z/domain/usecases/login/login_params.dart';
import 'package:uniguard_z/domain/usecases/login/login_usecase.dart';
import 'package:uniguard_z/domain/usecases/logout/logout.dart';
import 'package:uniguard_z/presentation/enums/drawer_page.dart';
import 'package:uniguard_z/presentation/providers/common/page_provider.dart';
import 'package:uniguard_z/presentation/providers/usecases/get_logged_in_user_provider.dart';
import 'package:uniguard_z/presentation/providers/usecases/login_provider.dart';
import 'package:uniguard_z/presentation/providers/usecases/logout_provider.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  FutureOr<User?> build() async {
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);

    var userResult = await getLoggedInUser(null);

    switch (userResult) {
      case Success(value: final user):
        return user;
      case Failed(message: _):
        return null;
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();

    Login login = ref.read(loginProvider);

    var result = await login(LoginParams(email: email, password: password));
  
    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> logout() async {
    Logout logout = ref.read(logoutProvider);
    var result = await logout(null);

    switch (result) {
      case Success(value: _):
        state = const AsyncData(null);
        ref.read(pageProvider.notifier).state = DrawerPage.home;

      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = AsyncData(state.valueOrNull);
    }
  }
}
