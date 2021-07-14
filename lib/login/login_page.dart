import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winjit_lutter_emo/common/widgets/textformfield.dart';
import 'package:winjit_lutter_emo/dashboard/applicaiton/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FocusNode focusUserName;
  late FocusNode focusPassword;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    focusUserName = FocusNode();
    focusPassword = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: GetBuilder<LoginController>(builder: ((_) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.1),
                        blurRadius: 6.0,
                        spreadRadius: 0.0, // soften the shadow
                      )
                    ],
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 24.0,
                  ),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UiTextFormField(
                            obscuredText: false,
                            focusNode: focusUserName,
                            textInputType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            label: "User Name",
                            errorHint: _.isInvalidUsername
                                ? "Invalid user name"
                                : null,
                            onChang: (value) {
                              _.setUserName(value);
                            },
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          UiTextFormField(
                            obscuredText: true,
                            focusNode: focusPassword,
                            textInputType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            label: "Enter Password",
                            errorHint:
                                _.isInvalidPassword ? "Invalid password" : null,
                            onChang: (value) {
                              _.setPassword(value);
                            },
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _.onLogin();
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                primary: Colors.blueAccent),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: _.isRememberMe,
                                  onChanged: (value) {
                                    _.setRememberMe(value!);
                                  }),
                              Text("Remember me"),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          );
        })));
  }

  void _requestFocus(FocusNode focusNode) {
    setState(() {
      focusNode.requestFocus();
    });
  }
}
