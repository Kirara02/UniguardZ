import 'package:uniguard_z/data/repositories/activity_repository.dart';
import 'package:uniguard_z/domain/entities/activity.dart';
import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/usecases/usecase.dart';

class GetActivities implements UseCase<Result<List<Activity>>, void> {
  final ActivityRepository _activityRepository;

  GetActivities({required ActivityRepository activityRepository}) : _activityRepository = activityRepository;

  @override
  Future<Result<List<Activity>>> call(void params) async {
    final result = await _activityRepository.getActivities();

    return switch (result) {
      Success(:final value) => Result.success(value),
      Failed(:final message) => Result.failed(message)
    };
  }
}
