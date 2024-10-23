import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniguard_z/domain/entities/branch.dart';
import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/usecases/get_forms/get_forms.dart';
import 'package:uniguard_z/presentation/providers/usecases/get_forms_provider.dart';

part 'forms_provider.g.dart';

@riverpod
class Forms extends _$Forms {
  @override
  FutureOr<List<Branch>> build() => [];

  Future<void> getForms() async {
    state = const AsyncLoading();

    GetForms getForms = ref.read(getFormsProvider);
    final result = await getForms(null);

    switch (result) {
      case Success(value: final forms):
        state = AsyncData(forms);

      case Failed(message: _):
        state = const AsyncData([]);
    }
  }
}
