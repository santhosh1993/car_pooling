import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashBoardState();
  }
}

class DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard" , style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromRGBO(107, 198, 211, 1.0),
      ),
      body: Center(
        child: Text("Dash Board"),
      )
    );
  }
}