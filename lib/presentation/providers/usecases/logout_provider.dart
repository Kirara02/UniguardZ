import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/domain/usecases/logout/logout.dart';
import 'package:uniguard_z/presentation/providers/repositories/auth_repository_provider.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout(LogoutRef ref) => Logout(authRepository: ref.watch(authRepositoryProvider));
