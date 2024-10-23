import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniguard_z/domain/entities/form_pick_list.dart';

part 'form_field.g.dart';
part 'form_field.freezed.dart';

@freezed
class FormField with _$FormField {
  factory FormField({
    required int id,
    required int formId,
    required int fieldTypeId,
    required bool isRequire,
    required String name,
    required int status,
    int? pickListId,
    @JsonKey(
        name: "FormPickList",
        fromJson: _fromJsonFormPickList,
        toJson: _toJsonFormPickList)
    List<FormPickList>? formPickList,
  }) = _FormField;

  factory FormField.fromJson(Map<String, dynamic> json) =>
      _$FormFieldFromJson(json);
}

// Custom converter functions
List<FormPickList>? _fromJsonFormPickList(dynamic json) {
  if (json == null) return null;
  if (json is List) {
    return json
        .map((e) => FormPickList.fromJson(e as Map<String, dynamic>))
        .toList();
  } else if (json is Map<String, dynamic>) {
    return [FormPickList.fromJson(json)];
  } else {
    throw Exception("Invalid FormPickList format");
  }
}

dynamic _toJsonFormPickList(List<FormPickList>? list) {
  if (list == null || list.isEmpty) return null;
  if (list.length == 1) {
    return list.first.toJson();
  }
  return list.map((e) => e.toJson()).toList();
}
