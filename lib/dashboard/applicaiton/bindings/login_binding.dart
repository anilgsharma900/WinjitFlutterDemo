import 'package:get/get.dart';
import 'package:winjit_lutter_emo/dashboard/applicaiton/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
