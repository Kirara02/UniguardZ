import 'package:uniguard_z/data/repositories/task_repository.dart';
import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/entities/task.dart';
import 'package:uniguard_z/domain/usecases/usecase.dart';

class GetTasks implements UseCase<Result<List<Task>>, void> {
  final TaskRepository _taskRepository;

  GetTasks({required TaskRepository taskRepository}) : _taskRepository = taskRepository;

  @override
  Future<Result<List<Task>>> call(void params) async {
    final result = await _taskRepository.getTasks();

    return switch (result) {
      Success(:final value) => Result.success(value),
      Failed(:final message) => Result.failed(message)
    };
  }
}
