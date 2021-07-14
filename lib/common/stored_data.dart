import 'package:get_storage/get_storage.dart';

class StoredData {
  static final StoredData _storedData = StoredData._privateConstructor();
  GetStorage? _getStorage;

  factory StoredData() {
    return _storedData;
  }

  StoredData._privateConstructor() {
    if (_getStorage == null) {
      _getStorage = GetStorage();
    }
  }

  void setIsUserLogin(bool isUserLogin) {
    _getStorage?.write("isUserLogin", isUserLogin);
  }

  bool isUserLogin() {
    return _getStorage?.read("isUserLogin") ?? false;
  }
}
