import 'package:flutter/material.dart';
import 'package:car_pooling/UI/DateHeader.dart';
import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';

class Driver extends StatefulWidget {
  DriverUIInterface interface;
  Driver(this.interface);

  @override
  State<StatefulWidget> createState() {
    return DriverState();
  }
}

class DriverState extends State<Driver> implements DateHeaderUIInterface{

  @override
  String get dateStr => widget.interface.dateStr;

  @override
  set dateStr(String _dateStr) {}

  @override
  void leftTapped() {
    setState(() {
      widget.interface.leftTapped();
    });
  }

  @override
  void rightTapped() {
    setState(() {
      widget.interface.rightTapped();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DateHeader(this),
      ],
    );
  }
}