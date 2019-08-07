import 'package:flutter/material.dart';
import 'package:car_pooling/UI/Login.dart';
import 'package:car_pooling/DataHandler/LoginData.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Car Pooling",
      home: Login(LoginData()),
    )
  );
}