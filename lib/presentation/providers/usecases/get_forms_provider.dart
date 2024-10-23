import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/domain/usecases/get_forms/get_forms.dart';
import 'package:uniguard_z/presentation/providers/repositories/form_repository_provider.dart';

part 'get_forms_provider.g.dart';

@riverpod
GetForms getForms(GetFormsRef ref) =>
    GetForms(formRepository: ref.watch(formRepositoryProvider));
