import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/domain/usecases/get_activities/get_activities.dart';
import 'package:uniguard_z/presentation/providers/repositories/activity_repository_provider.dart';

part 'get_activities_provider.g.dart';

@riverpod
GetActivities getActivities(GetActivitiesRef ref) =>
    GetActivities(activityRepository: ref.watch(activityRepositoryProvider));
