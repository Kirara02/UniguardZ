import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/domain/usecases/login/login_usecase.dart';
import 'package:uniguard_z/presentation/providers/repositories/auth_repository_provider.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) => Login(authRepository: ref.watch(authRepositoryProvider));
