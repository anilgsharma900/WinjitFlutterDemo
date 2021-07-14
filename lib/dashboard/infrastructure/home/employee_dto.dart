// To parse this JSON data, do
//
//     final employeeDto = employeeDtoFromJson(jsonString);

import 'dart:convert';

EmployeeDto employeeDtoFromJson(String str) =>
    EmployeeDto.fromJson(json.decode(str));

String employeeDtoToJson(EmployeeDto data) => json.encode(data.toJson());

class EmployeeDto {
  EmployeeDto({
    this.status,
    this.result,
  });

  String? status;
  List<Employee>? result;

  factory EmployeeDto.fromJson(Map<String, dynamic> json) => EmployeeDto(
        status: json["status"] == null ? null : json["status"],
        result: json["result"] == null
            ? null
            : List<Employee>.from(
                json["result"].map((x) => Employee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "result": result == null
            ? null
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Employee {
  Employee({this.name});

  String? name;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
      };
}
