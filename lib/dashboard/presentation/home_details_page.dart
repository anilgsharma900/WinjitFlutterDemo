import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winjit_lutter_emo/dashboard/applicaiton/home/home_controller.dart';
import 'package:winjit_lutter_emo/dashboard/infrastructure/home/employee_dto.dart';

class HomeDetailsPage extends StatelessWidget {
  Key? key;
  Employee? employee;

  HomeDetailsPage({this.key, this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Detail"),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<HomeController>(builder: ((_) {
            return Center(
              child: _.isDownloading
                  ? Column(
                      children: [
                        CircularProgressIndicator(),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text("downloaded ${_.progress}%")
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Name: ${employee?.name ?? ""}"),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                onPressed: () {
                                  _.selectPicture(employee!);
                                },
                                child: Text(
                                  "select picture",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    primary: Colors.blueAccent),
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                onPressed: () {
                                  _.downloadFiles();
                                },
                                child: Text(
                                  "Download picture",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    primary: Colors.blueAccent),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        _.file != null
                            ? Image.file(
                                _.file!,
                                fit: BoxFit.cover,
                                width: context.mediaQuery.size.width / 2,
                                height: context.mediaQuery.size.height / 3,
                              )
                            : SizedBox(),
                      ],
                    ),
            );
          })),
        ),
      ),
    );
  }
}
