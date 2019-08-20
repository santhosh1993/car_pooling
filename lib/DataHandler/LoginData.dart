import 'package:car_pooling/UI/Login.dart';
import 'package:car_pooling/ServiceLayer/LoginRequest.dart';
import 'package:flutter/material.dart';
import 'package:car_pooling/UI/Loader.dart';
import 'package:car_pooling/Model/User.dart';

class LoginData implements LoginUIInterface,LoginRequestInterface{
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

  Widget getWidget(){
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
    Loader.shared.removeLoaderFromContext();
    if (json["user_name"] != null){
      Navigator.pushNamed(context, '/Home');
    }
  }

  void loginTheUser() async {
      if(context != null) {
        Loader.shared.addLoaderToContext(context);
        Map data = await LoginRequest(this).login();
        result(data);
      }
  }
}