import 'package:flutter_test/flutter_test.dart';
import 'package:winjit_lutter_emo/dashboard/applicaiton/login/login_controller.dart';

void main() {
  group("Login Unit test initial values group", () {
    /// case #1 initial password value
    test("Login Unit testing", () async {
      LoginController loginController = LoginController();
      expect(loginController.password, "");
    });

    /// case #2 initial username value
    test("Login Unit testing", () async {
      LoginController loginController = LoginController();
      expect(loginController.userName, "");
    });

    /// case #3 isInvalidUsername
    test("Login Unit testing", () async {
      LoginController loginController = LoginController();
      expect(loginController.isInvalidUsername, false);
    });

    /// case #4 isInvalidPassword
    test("Login Unit testing", () async {
      LoginController loginController = LoginController();
      expect(loginController.isInvalidPassword, false);
    });
  });

  /// case #5
  test("Login uni test(invalid credentials)", () async {
    LoginController loginController = LoginController();
    String userName = "winjit";
    String password = "winjit@123";
    loginController.setUserName(userName);
    loginController.setPassword(password);
    loginController.onLogin();
    expect(loginController.isInvalidUsername, true);
    expect(loginController.isInvalidPassword, false);
  });

  /// case #6
  test("Login uni test(invalid password)", () async {
    LoginController loginController = LoginController();
    String userName = "Winjit";
    String password = "winjit@123";
    loginController.setUserName(userName);
    loginController.setPassword(password);
    loginController.onLogin();
    expect(loginController.isInvalidPassword, true);
    expect(loginController.isInvalidUsername, false);
  });
}
