import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:winjit_lutter_emo/common/response.dart';
import 'package:winjit_lutter_emo/dashboard/domain/home/i_home_repository.dart';

import 'employee_dto.dart';

class HomeRepository extends IHomeRepository {
  String dataException = "No Record Found";

  @override
  Future<Either<String, List<Employee>>> getEmployeesList() async {
    try {
      var response =
          json.decode(await rootBundle.loadString("config/employees.json"));

      final resMessage = response["status"];
      final resData = response["result"];

      CustomeResponse customeResponse = CustomeResponse(
          success: true,
          message: resMessage,
          data: resData,
          fullResponse: response);

      if (customeResponse.success!) {
        final responseList = customeResponse.fullResponse;
        EmployeeDto employeeDto = EmployeeDto.fromJson(responseList);
        return right(employeeDto.result!);
      }
      return left(dataException);
    } catch (e) {
      debugPrint(e.toString());
      return Left("No Record Found");
    }
  }
}
