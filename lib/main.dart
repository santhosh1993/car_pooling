import 'package:flutter/material.dart';
import 'package:car_pooling/UI/Login.dart';
import 'package:car_pooling/DataHandler/LoginData.dart';
import 'package:car_pooling/UI/Dashboard.dart';

void main() {
  String initalScreen =  '/';
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Car Pooling",
      initialRoute: initalScreen,
      routes: {
        '/': (context) => Login(LoginData()),
        '/dashboard': (context) => DashBoard(),
      },
    )
  );
}