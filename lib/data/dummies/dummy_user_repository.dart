import 'package:uniguard_z/data/repositories/user_repository.dart';
import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/entities/user.dart';

class DummyUserRepository implements UserRepository {
  @override
  Future<Result<User>> getUser() async {
    await Future.delayed(const Duration(seconds: 2));
    return Result.success(User(id: 0, name: "Kirara Bernstein", email: "kirara.verify@gmail.com"));
  }
}
