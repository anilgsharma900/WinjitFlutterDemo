import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winjit_lutter_emo/common/stored_data.dart';
import 'package:winjit_lutter_emo/route/app_routes.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 1),
        () => StoredData().isUserLogin()
            ? Get.offAllNamed(AppRoutes.home)
            : Get.offAllNamed(AppRoutes.login));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Center(
            child: Text(
          "Splash",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
