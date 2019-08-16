import 'package:flutter/material.dart';
import 'package:car_pooling/UI/Home.dart';
import 'package:car_pooling/DataHandler/DashBoardData.dart';
import 'package:car_pooling/UI/Admin.dart';
import 'package:car_pooling/DataHandler/AdminData.dart';
import 'package:car_pooling/UI/Driver.dart';
import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';
import 'package:car_pooling/DataHandler/DriverData.dart';

class HomeData implements HomeUIInterface {
  @override
  List<TabInterface> tabsData = [
    TabData(DashBoard(DashBoardData()), "Home", Icons.home),
    TabData(Admin(AdminData()), "Admin", Icons.supervised_user_circle),
    TabData(Driver(DriverData()), "Driver", Icons.person),
  ];
}

class TabData implements TabInterface {
  @override
  Widget tabView;

  @override
  String title;

  TabData(this.tabView,this.title,this.iconData);

  @override
  IconData iconData;
}