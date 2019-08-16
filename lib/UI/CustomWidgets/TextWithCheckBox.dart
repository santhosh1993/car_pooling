import 'package:flutter/material.dart';

class TextWithCheckBox extends StatelessWidget {

 final bool isSelected;
 GestureTapCallback onTap;
 final String title;

  TextWithCheckBox(this.isSelected, this.onTap, this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    IconData iconCheckBox = isSelected ? Icons.check_box : Icons.check_box_outline_blank;
    return  GestureDetector(
      onTap: this.onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide.none,
            right: BorderSide.none,
            top: BorderSide(color: Colors.white30),
            bottom: BorderSide(color: Colors.white30)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(iconCheckBox),
            Text(this.title,
                style: TextStyle(color: Colors.black,
                    fontSize: 15,
                  decoration: TextDecoration.none,
                ))
          ],
        ),
      ),
    );
  }
}