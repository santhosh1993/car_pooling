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
        Expanded(
          child: ListView.builder(
            itemCount: widget.interface.timings.length,
            itemBuilder: (context ,index) {
              return GestureDetector(
                child: TimingListTile(widget.interface.timings[index]),
                onTap: () {
                  widget.interface.selectedItem(index);
                },
              );
        }),
        ),
      ],
    );
  }
}

class TimingListTile extends StatelessWidget {
  final String title;
  TimingListTile(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10.0,right: 10.0),
          alignment: Alignment.centerLeft,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded( child: Text(title)),
              Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor,),
            ],
          ),
        ),
        Container(
          height: 2.0,
          width: double.infinity,
          color: Colors.grey,
        )
      ],
    );
  }
}