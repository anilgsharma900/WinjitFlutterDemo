import 'package:get/get.dart';
import 'package:winjit_lutter_emo/common/stored_data.dart';
import 'package:winjit_lutter_emo/route/app_routes.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  String userName = "";
  String password = "";
  bool isInvalidUsername = false;
  bool isInvalidPassword = false;
  bool isRememberMe = false;

  void setUserName(String userName) {
    this.userName = userName;
    update();
  }

  void setPassword(String password) {
    this.password = password;
    update();
  }

  void onLogin() {
    if (this.userName.trim() != "Winjit") {
      this.isInvalidUsername = true;
    } else if (this.password.trim() != "Winjit@123") {
      this.isInvalidUsername = false;
      this.isInvalidPassword = true;
    } else if (userName.trim() == "Winjit" && password.trim() == "Winjit@123") {
      StoredData().setIsUserLogin(isRememberMe);

      Get.offAllNamed(AppRoutes.home);
    }
    update();
  }

  void setRememberMe(bool isRemember) {
    this.isRememberMe = isRemember;
    update();
  }
}
