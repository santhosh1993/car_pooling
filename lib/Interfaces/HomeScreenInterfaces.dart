import 'package:flutter/material.dart';
import 'package:car_pooling/Model/TitleWithSelection.dart';

abstract class DateHeaderUIInterface {
  String dateStr;
  void leftTapped();
  void rightTapped();
}

abstract class DashBoardUIInterface extends DateHeaderUIInterface {
  List<DashBoardListTileInterface> items;
  BuildContext context;
}

abstract class DriverUIInterface extends DateHeaderUIInterface {
  List<String> timings;
  List<PeopleListItemInterface> getListOfPeople();
  List<TitleWithSelection> studentDetails;
  selectedItem(int index);
  BuildContext context;
}

abstract class AdminUIInterface extends DriverUIInterface {

}

abstract class PeopleListItemInterface {

}

abstract class HomeUIInterface {
  List<TabInterface> tabsData;
  int currentSelectIndex;
  changeCurrentSelectIndex(int index);
  Widget getCurrentSelectWidget();
  String getCurrentSelectedTitle();
}

abstract class TabInterface {
  String title;
  Widget tabView;
}

abstract class DashBoardListTileInterface {
  String time;
  List<String> names;
  int selectedIndex;

  void selectedName(int index);
}