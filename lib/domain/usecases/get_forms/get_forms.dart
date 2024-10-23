import 'package:uniguard_z/data/repositories/form_repository.dart';
import 'package:uniguard_z/domain/entities/branch.dart';
import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/usecases/usecase.dart';

class GetForms implements UseCase<Result<List<Branch>>, void> {
  final FormRepository _formRepository;

  GetForms({required FormRepository formRepository})
      : _formRepository = formRepository;

  @override
  Future<Result<List<Branch>>> call(_) async {
    final result = await _formRepository.getForms();

    return switch (result) {
      Success(:final value) => Result.success(value),
      Failed(:final message) => Result.failed(message)
    };
  }
}
