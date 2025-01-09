import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/entities/task.dart';
import 'package:uniguard_z/domain/usecases/get_tasks/get_tasks.dart';
import 'package:uniguard_z/presentation/providers/usecases/get_tasks.dart';

part 'tasks_provider.g.dart';

@riverpod
class Tasks extends _$Tasks {
  @override
  FutureOr<List<Task>> build() => [];

  Future<void> getTasks() async {
    state = const AsyncLoading();

    GetTasks getTasks = ref.read(getTasksProvider);

    final result = await getTasks(null);

    if (!ref.exists(tasksProvider)) return;

    switch (result) {
      case Success(value: final tasks):
        state = AsyncData(tasks);

      case Failed(message: _):
        state = const AsyncData([]);
    }
  }
}
