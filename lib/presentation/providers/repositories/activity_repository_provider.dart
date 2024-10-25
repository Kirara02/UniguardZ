import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/data/dummies/dummy_activity_repository.dart';
import 'package:uniguard_z/data/repositories/activity_repository.dart';

part 'activity_repository_provider.g.dart';

@riverpod
ActivityRepository activityRepository(ActivityRepositoryRef ref) => DummyActivityRepository();
