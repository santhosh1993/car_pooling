import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:car_pooling/ServiceLayer/BaseRequest.dart';

abstract class LoginRequestInterface {
  String userName;
  String password;
  void result(Map json);
}

class LoginRequest extends BaseRequest {
  final LoginRequestInterface interface;
  LoginRequest(this.interface);

  void login() {
    getJson();
  }

  void getJson() async {
    String apiURL = "http://10.71.165.74:8000/login/";

    Map<String, String> body = {
      "userName": interface.userName,
      "password": interface.password,
    };

    http.Response response = await http.post(apiURL, headers: headers, body: body);
    interface.result(json.decode(response.body));
  }
}