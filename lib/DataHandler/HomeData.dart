import 'package:flutter/material.dart';
import 'package:car_pooling/UI/Home.dart';
import 'package:car_pooling/DataHandler/DashBoardData.dart';
import 'package:car_pooling/UI/Admin.dart';
import 'package:car_pooling/DataHandler/AdminData.dart';
import 'package:car_pooling/UI/Driver.dart';

class HomeData implements HomeUIInterface {
  @override
  List<TabInterface> tabsData = [
    TabData(DashBoard(DashBoardData()), "Book a Seat"),
    TabData(Admin(AdminData()), "Admin"),
    TabData(Driver(), "Driver"),
  ];
}

class TabData implements TabInterface {
  @override
  Widget tabView;

  @override
  String title;

  TabData(this.tabView,this.title);
}