import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> getUser();
}
