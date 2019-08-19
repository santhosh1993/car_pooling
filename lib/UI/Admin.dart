import 'package:flutter/material.dart';
import 'package:car_pooling/UI/DateHeader.dart';
import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';
import 'package:car_pooling/UI/Driver.dart';

class Admin extends StatefulWidget {
  AdminUIInterface interface;
  Admin(this.interface);

  @override
  State<StatefulWidget> createState() {
    return AdminState();
  }
}

class AdminState extends State<Admin> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
          child: Text("Admin"),
      ),
        ],
      ),
    );
  }
}