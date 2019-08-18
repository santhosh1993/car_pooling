import 'package:flutter/material.dart';
import 'package:car_pooling/UI/Home.dart';
import 'package:car_pooling/DataHandler/DashBoardData.dart';
import 'package:car_pooling/DataHandler/AdminData.dart';
import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';
import 'package:car_pooling/DataHandler/DriverData.dart';
import 'package:car_pooling/ServiceLayer/SeatAvailabilityRequest.dart';
import 'package:car_pooling/Model/Service.dart';

class HomeData implements HomeUIInterface, SeatAvailabilityRequestInterface {

  @override
  List<TabInterface> tabsData = [];

  Home home;
  DashBoardData _dashBoardData = DashBoardData();
  DriverData _driverData = DriverData();
  AdminData _adminData = AdminData();
  Map<String,Map<String,List<Service>>> groupedData = {};

  HomeData(){
    tabsData = [
      TabData(_dashBoardData.getWidget(), "Home", Icons.home),
      TabData(_adminData.getWidget(), "Admin", Icons.supervised_user_circle),
      TabData(_driverData.getWidget(), "Driver", Icons.person),
    ];
    home = Home(this);

    getTheServices();
  }

  getTheServices() async {
    List data = await SeatAvailabilityRequest(this).getSeatAvailabilityList();
    ServicesList services = ServicesList(data);
    groupedData = services.groupByDateAndByTime();
    updateTheChildWidgets();
  }

  updateTheChildWidgets() {
    _dashBoardData.updateData(groupedData);
  }

  Widget getWidget(){
    return home;
  }
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