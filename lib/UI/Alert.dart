import 'package:flutter/material.dart';


class AlertHandler {


  static showAlertOnContext(BuildContext context, SimpleAlertData alertData) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(alertData.title),
        content: Text(alertData.content),
        actions: <Widget>[
          FlatButton(
            child: Text(alertData.leftButtonTitle),
            onPressed: alertData.leftButtonPressed,
          ),
          FlatButton(
            child: Text(alertData.rightButtonTitle),
            onPressed: alertData.rightButtonPressed,
          )
        ],
      )
    );
  }
}

class SimpleAlertData {

  SimpleAlertData(this.title, this.content,
      this.leftButtonTitle, this.rightButtonTitle,
      this.leftButtonPressed, this.rightButtonPressed);
  String title;
  String content;
  String leftButtonTitle;
  VoidCallback leftButtonPressed;
  String rightButtonTitle;
  VoidCallback rightButtonPressed;

}