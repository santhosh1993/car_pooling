import 'package:flutter/material.dart';


class AlertHandler {


  static showAlertOnContext(BuildContext context, SimpleAlertData alertData) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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