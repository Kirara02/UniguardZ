import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/data/dummies/dummy_form_repository.dart';
import 'package:uniguard_z/data/repositories/form_repository.dart';

part 'form_repository_provider.g.dart';

@riverpod
FormRepository formRepository(FormRepositoryRef ref) => DummyFormRepository();
