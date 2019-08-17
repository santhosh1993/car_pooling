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

  Future<Map> login() async{
    return await getJson();
  }

  Future<Map> getJson() async {
    String apiURL = baseUrl + "User/login/";

    Map<String, String> body = {
      "email_id": interface.userName,
      "password": interface.password,
    };

    http.Response response = await http.post(apiURL, headers: headers, body: body);
    return json.decode(response.body);
    interface.result(json.decode(response.body));
  }
}
