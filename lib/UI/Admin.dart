import 'package:car_pooling/Model/TitleWithSelection.dart';
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

class AdminState extends State<Admin> implements DateHeaderUIInterface {

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
    widget.interface.context = context;
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
          child: Driver(widget.interface),
      ),
        ],
      ),
    );
  }

}