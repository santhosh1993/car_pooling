import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlertHandler {


  static showAlertOnContext(BuildContext context, SimpleAlertData alertData) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(alertData.title),
        content: Text(alertData.content),
        actions: alertData.buttons,
      )
    );
  }
}

class SimpleAlertData {
  String title;
  String content;
  List<FlatButton> buttons;

  SimpleAlertData(this.title, this.content,this.buttons);
}