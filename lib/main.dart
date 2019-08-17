import 'package:flutter/material.dart';
import 'package:car_pooling/DataHandler/LoginData.dart';
import 'package:car_pooling/DataHandler/HomeData.dart';

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
        '/': (context) => LoginData().getWidget(),
        '/Home': (context) => HomeData().getWidget(),
      },
    )
  );
}