import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Result<User>> login({required String email, required String password});
  Future<Result<String>> logout();
  Future<bool> getLoggedInUser();
}
