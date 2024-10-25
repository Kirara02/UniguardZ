import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniguard_z/domain/entities/task_field.dart';

part 'task.g.dart';
part 'task.freezed.dart';

@freezed
class Task with _$Task {
  factory Task({
    required int id,
    required String name,
    @JsonKey(name: "TaskFields") required List<TaskField> taskFields,
    required int allowedTime,
    required int branchId,
    required DateTime createdAt,
    required int occurance,
    required DateTime startDateTime,
    required DateTime updatedAt,
    required DateTime validDateTime,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
