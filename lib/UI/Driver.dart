import 'package:flutter/material.dart';

class Driver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DriverState();
  }
}

class DriverState extends State<Driver> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Driver"),
    );
  }
}