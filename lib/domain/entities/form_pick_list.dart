import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniguard_z/domain/entities/form_pick_list_option.dart';

part 'form_pick_list.freezed.dart';
part 'form_pick_list.g.dart';

@freezed
class FormPickList with _$FormPickList {
  factory FormPickList({
    required int id,
    required String name,
    required int status,
    @JsonKey(name: "FormPickListOptions")
    required List<FormPickListOption> formPickListOptions,
  }) = _FormPickList;

  factory FormPickList.fromJson(Map<String, dynamic> json) =>
      _$FormPickListFromJson(json);
}
