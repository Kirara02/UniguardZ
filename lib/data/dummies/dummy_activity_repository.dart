import 'package:uniguard_z/data/repositories/activity_repository.dart';
import 'package:uniguard_z/domain/entities/activity.dart';
import 'package:uniguard_z/domain/entities/result.dart';

class DummyActivityRepository implements ActivityRepository {
  @override
  Future<Result<List<Activity>>> getActivities() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Map<String, dynamic> activity1 = {
      "comments": "1",
      "createdAt": "2019-04-03T23:24:12.000Z",
      "id": 10,
      "isGPS": true,
      "isPhoto": true,
      "name": "Area Check",
      "updatedAt": "2019-06-27T01:25:53.000Z"
    };
    Map<String, dynamic> activity2 = {
      "comments": "1",
      "createdAt": "2019-09-23T01:33:18.000Z",
      "id": 47,
      "isGPS": true,
      "isPhoto": true,
      "name": "Fence Check",
      "updatedAt": "2019-11-21T02:40:27.000Z"
    };
    Map<String, dynamic> activity3 = {
      "comments": "1",
      "createdAt": "2019-10-02T00:16:37.000Z",
      "id": 53,
      "isGPS": true,
      "isPhoto": true,
      "name": "Car Park Clean Up",
      "updatedAt": "2019-10-02T00:16:37.000Z"
    };

    List<Activity> results = [
      Activity.fromJson(activity1),
      Activity.fromJson(activity2),
      Activity.fromJson(activity3),
    ];

    return Result.success(results);
  }
}
