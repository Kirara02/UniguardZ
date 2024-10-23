import 'package:uniguard_z/data/repositories/auth_repository.dart';
import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/usecases/usecase.dart';

class Logout implements UseCase<Result<String>, void> {
  final AuthRepository _authRepository;

  Logout({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Result<String>> call(void params)async {
    var result = await _authRepository.logout();
    return switch (result) {
      Success(:final value) => Result.success(value),
      Failed(:final message) => Result.failed(message)
    };
  }
}
