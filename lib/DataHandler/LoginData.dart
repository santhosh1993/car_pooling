import 'package:car_pooling/UI/Login.dart';
import 'package:car_pooling/ServiceLayer/LoginRequest.dart';
import 'package:flutter/material.dart';

class LoginData implements LoginUIInterface,LoginRequestInterface{
  @override
  String userName = "";
  @override
  String password = "";
  @override
  BuildContext context;

  @override
  void loginButtonTapped() {
    print(userName + "  " + password);
    loginTheUser();
  }

  @override
  void result(Map json) {
    // TODO: implement result
    print(json["userName"]);
    if (json["userName"] == null){
      Navigator.pushNamed(context, '/Home');
    }
  }

  void loginTheUser() {
    Navigator.pushNamed(context, '/Home');

    //LoginRequest(this).login();
  }
}