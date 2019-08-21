import 'package:car_pooling/UI/Login.dart';
import 'package:car_pooling/ServiceLayer/LoginRequest.dart';
import 'package:flutter/material.dart';
import 'package:car_pooling/UI/Loader.dart';
import 'package:car_pooling/Model/User.dart';
import 'package:car_pooling/UI/Alert.dart';

class LoginData implements LoginUIInterface, LoginRequestInterface {
  @override
  String userName = "";
  @override
  String password = "";
  @override
  BuildContext context;

  Login login;

  LoginData() {
    login = Login(this);
  }

  Widget getWidget() {
    return login;
  }

  @override
  void loginButtonTapped() {
    print(userName + "  " + password);
    loginTheUser();
  }

  @override
  void result(Map json) {
    // TODO: implement result
    print(json);
    User.updateUser(json);
    if (json["user_name"] != null) {
      Navigator.pushNamed(context, '/Home');
    }
    else {
      List<FlatButton> buttons = [
        FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("OK")),
      ];
      String message = json["message"] ?? "";
      AlertHandler.showAlertOnContext(context, SimpleAlertData("Login Error", message, buttons));
    }
  }

  void loginTheUser() async {
    Map data = await LoginRequest(this).login();
    result(data);
  }
}
