import 'package:flutter/material.dart';

abstract class LoginUIInterface {
  String userName;
  String password;
  BuildContext context;
  void loginButtonTapped();
}