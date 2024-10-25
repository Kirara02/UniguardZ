import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/domain/usecases/get_tasks/get_tasks.dart';
import 'package:uniguard_z/presentation/providers/repositories/task_repository_provider.dart';

part 'get_tasks.g.dart';

@riverpod
GetTasks getTasks(GetTasksRef ref) => GetTasks(taskRepository: ref.watch(taskRepositoryProvider));
