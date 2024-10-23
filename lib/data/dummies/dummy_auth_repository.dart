import 'package:uniguard_z/data/repositories/auth_repository.dart';
import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/entities/user.dart';
import 'package:uniguard_z/presentation/misc/token_helper.dart';

class DummyAuthRepository implements AuthRepository {
  @override
  Future<Result<User>> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    await TokenHelper().setLoginStatus(true);
    return Result.success(User(id: 0, name: "Kirara Bernstein", email: "kirara.verify@gmail.com"));
  }

  @override
  Future<Result<String>> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    await TokenHelper().setLoginStatus(false);
    return const Result.success("Logout successfully");
  }

  @override
  Future<bool> getLoggedInUser() async {
    await Future.delayed(const Duration(seconds: 2));
    var result = await TokenHelper().getLoginStatus();
    return result;
  }
}
