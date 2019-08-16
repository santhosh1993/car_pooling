import 'package:flutter/material.dart';

class Loader {
  static Loader shared =  Loader();
  bool onTapDelete = false;

  OverlayEntry _loaderOverlay;

  _Loader() {}

  addLoaderToContext(BuildContext context) {
    if(_loaderOverlay == null) {
      _loaderOverlay = getOverlayEntry();
      Overlay.of(context).insert(_loaderOverlay);
    }
  }

  removeLoaderFromContext() {
    if(_loaderOverlay != null) {
      _loaderOverlay.remove();
    }
  }

  OverlayEntry getOverlayEntry() {
    return OverlayEntry(
        builder: (context) => Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5)
          ),
          child: GestureDetector(
              child: Center(
                child: CircularProgressIndicator(),
              ),
              onTap: (){
                if (onTapDelete){
                  removeLoaderFromContext();
                }
              },
          ) ,
        )
    );
  }
}
