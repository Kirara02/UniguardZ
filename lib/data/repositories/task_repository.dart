import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/entities/task.dart';

abstract interface class TaskRepository {
  Future<Result<List<Task>>> getTasks();
}
