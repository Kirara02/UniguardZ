import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/data/dummies/dummy_task_repository.dart';
import 'package:uniguard_z/data/repositories/task_repository.dart';

part 'task_repository_provider.g.dart';

@riverpod
TaskRepository taskRepository(TaskRepositoryRef ref) => DummyTaskRepository();
