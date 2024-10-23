import 'package:uniguard_z/data/repositories/auth_repository.dart';
import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/entities/user.dart';
import 'package:uniguard_z/domain/usecases/login/login_params.dart';
import 'package:uniguard_z/domain/usecases/usecase.dart';

class Login implements UseCase<Result<User>, LoginParams> {
  final AuthRepository _authRepository;

  Login({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Result<User>> call(LoginParams params) async {
    var results = await _authRepository.login(email: params.email, password: params.password);

    return switch (results) {
      Success(value: final result) => Result.success(result),
      Failed(:final message) => Result.failed(message)
    };
  }
}
