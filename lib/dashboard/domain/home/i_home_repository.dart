import 'package:dartz/dartz.dart';
import 'package:winjit_lutter_emo/dashboard/infrastructure/home/employee_dto.dart';

abstract class IHomeRepository {
  Future<Either<String, List<Employee>>> getEmployeesList();
}
