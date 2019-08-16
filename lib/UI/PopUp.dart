import 'package:flutter/material.dart';

class PopUp {

  // Using singleton because we can only show one popup at a time

  static PopUp shared = PopUp();

  OverlayEntry popupOverlay;

  _PopUP(){}

  showPopUpOnContext(BuildContext context, Widget widgetToBeAdded) {
    // Create Whenever needed
    popupOverlay = _createPopUpOverlay(widgetToBeAdded);
    Overlay.of(context).insert(popupOverlay);
  }

  removePopUpFromContext() {
    this.popupOverlay.remove();
  }

  OverlayEntry _createPopUpOverlay(Widget widget) {

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: removePopUpFromContext,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 30),
            child: widget,
          ),
        ),
      )
    );
  }
}