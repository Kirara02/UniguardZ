import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:uniguard_z/presentation/providers/repositories/auth_repository_provider.dart';
import 'package:uniguard_z/presentation/providers/repositories/user_repository_provider.dart';

part 'get_logged_in_user_provider.g.dart';

@riverpod
GetLoggedInUser getLoggedInUser(GetLoggedInUserRef ref) => GetLoggedInUser(
    authRepository: ref.watch(authRepositoryProvider), userRepository: ref.watch(userRepositoryProvider));
