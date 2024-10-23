import 'package:uniguard_z/domain/entities/branch.dart';
import 'package:uniguard_z/domain/entities/result.dart';

abstract interface class FormRepository {
  Future<Result<List<Branch>>> getForms();
}
