import 'package:car_pooling/Interface/LoginUIInterface.dart';

class LoginData implements LoginUIInterface{
  @override
  String userName = "";
  @override
  String password = "";

  @override
  void loginButtonTapped() {
    print(userName + "  " + password);
  }

}