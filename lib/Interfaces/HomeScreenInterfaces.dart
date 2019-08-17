import 'package:flutter/material.dart';

abstract class DateHeaderUIInterface {
  String dateStr;
  void leftTapped();
  void rightTapped();
}

abstract class DashBoardUIInterface extends DateHeaderUIInterface {
  List<DashBoardListTileInterface> items;
  BuildContext context;
}

abstract class AdminUIInterface extends DriverUIInterface {

}

abstract class DriverUIInterface extends DateHeaderUIInterface {
    List<String> timings;
    List<PeopleListItemInterface> getListOfPeople();

    void selectedItem(int index);
}

abstract class PeopleListItemInterface {

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

  void selectedName(int index);
}