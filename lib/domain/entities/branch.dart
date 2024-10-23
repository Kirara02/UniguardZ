import 'package:freezed_annotation/freezed_annotation.dart';
import 'form_field.dart'; // Import model FormField

part 'branch.freezed.dart';
part 'branch.g.dart';

@freezed
class Branch with _$Branch {
  factory Branch({
    required int id,
    required String name,
    @JsonKey(name: "FormFields") required List<FormField> formFields,
    int? checkPointId,
    String? createdAt,
    String? updatedAt,
    int? roleId,
    int? parentBranchId,
  }) = _Branch;

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
}