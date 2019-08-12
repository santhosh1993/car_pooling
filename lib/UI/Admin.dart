import 'package:flutter/material.dart';
import 'package:car_pooling/UI/Home.dart';
import 'package:car_pooling/UI/DateHeader.dart';

class Admin extends StatefulWidget {
  AdminUIInterface interface;
  Admin(this.interface);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdminState();
  }
}

class AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: DateHeader(widget.interface),
    );
  }
}