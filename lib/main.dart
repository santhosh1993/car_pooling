import 'package:flutter/material.dart';
import 'package:car_pooling/UI/Login.dart';
import 'package:car_pooling/DataHandler/LoginData.dart';
import 'package:car_pooling/UI/Dashboard.dart';
import 'package:car_pooling/DataHandler/DashBoardData.dart';

void main() {
  String initalScreen =  '/';
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Car Pooling",
      initialRoute: initalScreen,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(107, 198, 211, 1.0),
      ),
      routes: {
        '/': (context) => Login(LoginData()),
        '/dashboard': (context) => DashBoard(DashBoardData()),
      },
    )
  );
}