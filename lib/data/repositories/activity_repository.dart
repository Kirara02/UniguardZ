import 'package:uniguard_z/domain/entities/activity.dart';
import 'package:uniguard_z/domain/entities/result.dart';

abstract interface class ActivityRepository {
  Future<Result<List<Activity>>> getActivities();
}
