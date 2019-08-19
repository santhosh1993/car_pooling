import 'package:flutter/material.dart';

abstract class DateHeaderUIInterface {
  String dateStr;
  void leftTapped();
  void rightTapped();
}

abstract class DashBoardUIInterface extends DateHeaderUIInterface {
  BuildContext context;
  DashboardUICallback callback;
}

abstract class DashboardUICallback {
  updateData(List<DashBoardListTileInterface> items);
}

abstract class HomeUIInterface {
  List<TabInterface> tabsData;
}

abstract class TabInterface {
  String title;
  Widget tabView;
  IconData iconData;
}

abstract class DashBoardListTileInterface {
  String time;
  List<String> names;
  int selectedIndex;
  DashBoardListTileUICallback callback;
  void selectedName(int index);
}

abstract class DashBoardListTileUICallback {
  updateData(List<String> names);
}