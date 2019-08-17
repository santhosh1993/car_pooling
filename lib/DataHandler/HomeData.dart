import 'package:flutter/material.dart';
import 'package:car_pooling/UI/Home.dart';
import 'package:car_pooling/DataHandler/DashBoardData.dart';
import 'package:car_pooling/DataHandler/AdminData.dart';
import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';
import 'package:car_pooling/DataHandler/DriverData.dart';

class HomeData implements HomeUIInterface {

  Home home;

  HomeData(){
    home = Home(this);
  }

  Widget getWidget(){
    return home;
  }

  @override
  List<TabInterface> tabsData = [
    TabData(DashBoardData().getWidget(), "Home"),
    TabData(AdminData().getWidget(), "Admin"),
    TabData(DriverData().getWidget(), "Driver"),
  ];
}

class TabData implements TabInterface {
  @override
  Widget tabView;

  @override
  String title;

  TabData(this.tabView,this.title);
}