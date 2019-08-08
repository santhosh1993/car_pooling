import 'package:car_pooling/Interface/LoginUIInterface.dart';
import 'package:car_pooling/ServiceLayer/LoginRequest.dart';

class LoginData implements LoginUIInterface,LoginRequestInterface{
  @override
  String userName = "";
  @override
  String password = "";

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

    }
  }

  void loginTheUser() {
    LoginRequest(this).login();
  }
}