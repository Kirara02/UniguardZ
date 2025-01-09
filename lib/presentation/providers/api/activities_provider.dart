import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/domain/entities/activity.dart';
import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/usecases/get_activities/get_activities.dart';
import 'package:uniguard_z/presentation/providers/usecases/get_activities_provider.dart';

part 'activities_provider.g.dart';

@riverpod
class Activities extends _$Activities {
  @override
  FutureOr<List<Activity>> build() => [];

  Future<void> getActivities() async {
    state = const AsyncLoading();

    GetActivities getActivities = ref.read(getActivitiesProvider);
    final result = await getActivities(null);

    if (!ref.exists(activitiesProvider)) return;

    switch (result) {
      case Success(value: final activities):
        state = AsyncData(activities);

      case Failed(message: _):
        state = const AsyncData([]);
    }
  }
}
