import 'package:flutter/material.dart';
import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';

class DateHeader extends StatefulWidget {
  final DateHeaderUIInterface interface;
  DateHeader(this.interface);

  @override
  State<StatefulWidget> createState() {
    return DateHeaderState();
  }
}

class DateHeaderState extends State<DateHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 50.0,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {
                    widget.interface.leftTapped();
                  });
                },
                child: Text("<"),
                padding: EdgeInsets.all(10.0),
              ),
              Text(widget.interface.dateStr),
              FlatButton(
                onPressed: () {
                  setState(() {
                    widget.interface.rightTapped();
                  });
                },
                child: Text(">"),
                padding: EdgeInsets.all(10.0),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          height: 2.0,
        ),
      ],
    );
  }
}