import 'package:get/get.dart';
import 'package:winjit_lutter_emo/dashboard/applicaiton/home/home_controller.dart';
import 'package:winjit_lutter_emo/dashboard/domain/home/i_home_repository.dart';
import 'package:winjit_lutter_emo/dashboard/infrastructure/home/home_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeRepository>(() => HomeRepository());
    Get.put<HomeController>(
        HomeController(iHomeRepository: Get.find<IHomeRepository>()));
  }
}
