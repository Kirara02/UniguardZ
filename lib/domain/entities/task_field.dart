import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_field.freezed.dart';
part 'task_field.g.dart';

@freezed
class TaskField with _$TaskField {
  const factory TaskField({
    required int fieldTypeId,
    required int id,
    required String name,
    required int status,
  }) = _TaskField;

  factory TaskField.fromJson(Map<String, dynamic> json) => _$TaskFieldFromJson(json);
}
