import 'package:flutter/material.dart';
import 'package:car_pooling/UI/DateHeader.dart';
import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';
import 'package:car_pooling/UI/Home.dart';

class Driver extends StatefulWidget {
  DriverUIInterface interface;
  List<DashBoardListTileInterface> _items = [];

  Driver(this.interface);

  @override
  State<StatefulWidget> createState() {
    return DriverState();
  }
}

class DriverState extends State<Driver> implements DateHeaderUIInterface, DashboardUICallback{

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
    widget.interface.callback = this;

    return Column(children: <Widget>[
      DateHeader(this),
      Expanded(
        child: getList(),
      ),
    ]);
  }

  Widget getList() {
    if (widget._items.length > 0) {
      return ListView.builder(
          itemCount: widget._items.length,
          itemBuilder: (context, index) {
            return DashBoardListTile(widget._items[index]);
          });
    }
    return Center(
      child: Text("No Data available...."),
    );
  }

  @override
  updateData(List<DashBoardListTileInterface> items) {
    setState(() {
      widget._items = items;
    });
  }
}