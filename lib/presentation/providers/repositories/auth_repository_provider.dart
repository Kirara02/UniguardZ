import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/data/dummies/dummy_auth_repository.dart';
import 'package:uniguard_z/data/repositories/auth_repository.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => DummyAuthRepository();
