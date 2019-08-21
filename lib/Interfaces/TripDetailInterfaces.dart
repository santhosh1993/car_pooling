import 'package:flutter/material.dart';

abstract class TripDetailUIInterface {
  bool isMaxBookingEditable;
  int maxBookings;
  int totalBookings;
  String buttonTitle;
  TripDetailUICallBack callBack;
  BuildContext context;

  buttonTapped();
}

abstract class TripDetailUICallBack {
  updateList(List<TripDetailListTileInterface> names);
}

abstract class TripDetailListTileInterface {
  String name;
  String empID;
  bool isSelected;
}