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

class AdminState extends State<Admin> implements DateHeaderUIInterface,DriverUIInterface {
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
  List<String> get timings => widget.interface.timings;

  @override
  set timings(List<String> _timings) {

  }

  @override
  List<PeopleListItemInterface> getListOfPeople() {
    return widget.interface.getListOfPeople();
  }

  @override
  void selectedItem(int index) {
    widget.interface.selectedItem(index);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
          child: Driver(this),
      ),
        ],
      ),
    );
  }
}