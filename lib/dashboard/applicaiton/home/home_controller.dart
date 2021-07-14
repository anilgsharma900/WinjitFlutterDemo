import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:winjit_lutter_emo/dashboard/domain/home/i_home_repository.dart';
import 'package:winjit_lutter_emo/dashboard/infrastructure/home/employee_dto.dart';

class HomeController extends GetxController {
  final IHomeRepository? iHomeRepository;

  HomeController({this.iHomeRepository});

  @override
  void onInit() {
    super.onInit();
    getEmployees();
  }

  List<Employee> employeeList = [];
  String errorMsg = "";
  File? file;

  void getEmployees() async {
    print("employee list called");
    Either<String, List<Employee>> failureOrSuccess =
        await iHomeRepository!.getEmployeesList();

    failureOrSuccess.fold(
        (error) => errorMsg = error, (success) => employeeList = success);
    update();
  }

  void selectPicture(Employee emp) async {
    try {
      PickedFile? pickedFile = await ImagePicker()
          .getImage(source: ImageSource.gallery, imageQuality: 50);
      this.file = await File(pickedFile!.path);

      update();
    } catch (e) {}
  }

  void uploadPicture() async {
    // can do using dio package as post method.
    update();
  }

  bool isDownloading = false;
  String progress = "";

  void downloadFiles() async {
    try {
      Dio dio = Dio();
      var docDir = await getExternalStorageDirectory();
      StringBuffer buffer = StringBuffer();
      buffer.write(docDir!.path);
      buffer.write("/winjit01");

      bool isFolderExist = await Directory(buffer.toString()).exists();
      if (!isFolderExist) {
        await Directory(buffer.toString()).create(recursive: true);
      }
      var name = "${buffer.toString()}/profile.jpg";
      String smalSizeImg =
          "https://live.staticflickr.com/65535/50137099548_be9ddb10ce_b.jpg";
      String hdImg = "https://wallpapercave.com/wp/wp2559551.jpg";

      dio.download(
        hdImg,
        name,
        onReceiveProgress: (count, total) {
          if (total != -1) {
            isDownloading = true;
            progress = ((count / total) * 100).toStringAsFixed(0);
            if (progress == '100') {
              isDownloading = false;
            } else if (double.parse(progress) < 100) {}
          }
          update();
        },
        deleteOnError: true,
      ).then((_) {
        isDownloading = false;
        update();
      });

      update();
    } catch (e) {
      isDownloading = false;
      update();
    }
  }
}
