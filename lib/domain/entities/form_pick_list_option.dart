import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_pick_list_option.g.dart';
part 'form_pick_list_option.freezed.dart';

@freezed
class FormPickListOption with _$FormPickListOption {
  factory FormPickListOption({
    required int id,
    required String name,
    required int status,
  }) = _FormPickListOption;

  factory FormPickListOption.fromJson(Map<String, dynamic> json) =>
      _$FormPickListOptionFromJson(json);
}
