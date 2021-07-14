import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winjit_lutter_emo/dashboard/applicaiton/bindings/home_binding.dart';
import 'package:winjit_lutter_emo/dashboard/applicaiton/home/home_controller.dart';
import 'package:winjit_lutter_emo/dashboard/infrastructure/home/employee_dto.dart';
import 'package:winjit_lutter_emo/dashboard/presentation/home_details_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Employees"),
        ),
        body: GetBuilder<HomeController>(builder: ((_) {
          return Container(
            child: ListView.builder(
                itemCount: _.employeeList.length,
                itemBuilder: (context, index) {
                  Employee emp = _.employeeList[index];
                  return ListTile(
                    title: Text(emp.name ?? ""),
                    onTap: () {
                      Get.to(
                          () => HomeDetailsPage(
                                employee: emp,
                              ),
                          binding: HomeBinding());
                    },
                  );
                }),
          );
        })));
  }
}
