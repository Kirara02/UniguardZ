import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.g.dart';
part 'activity.freezed.dart';

@freezed
class Activity with _$Activity {
  factory Activity({
    required int id,
    required String name,
    @JsonKey(name: "isGPS") required bool isGps,
    required bool isPhoto,
    required String comments,
    DateTime? createdAt,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
