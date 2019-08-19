import 'package:flutter/material.dart';
import 'package:car_pooling/Interfaces/TripDetailInterfaces.dart';

class TripDetail extends StatefulWidget {
  TripDetailUIInterface interface;

  TripDetail(this.interface);

  @override
  State<StatefulWidget> createState() {
    return TripDetailState();
  }
}

class TripDetailState extends State<TripDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
            "Trip Detail",
            style: TextStyle(color: Colors.white),
      ),
      ),
      body: Center(
        child: Text("Trip Detail"),
      ),
    );
  }
}