import 'package:flutter/material.dart';
import 'package:car_pooling/UI/Home.dart';
import 'package:car_pooling/DataHandler/DashBoardData.dart';
import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';
import 'package:car_pooling/ServiceLayer/SeatAvailabilityRequest.dart';
import 'package:car_pooling/Model/Service.dart';
import 'package:car_pooling/DataHandler/ProfileData.dart';
import 'package:car_pooling/UI/Loader.dart';

class HomeData implements HomeUIInterface {

  @override
  List<TabInterface> tabsData = [];

  @override
  BuildContext context;

  Home home;
  DashBoardData _dashBoardData = DashBoardData();
  ProfileData _profileData = ProfileData();
  Map<String,Map<String,List<Service>>> groupedData = {};

  HomeData(){
    tabsData = [
      TabData(_dashBoardData.getWidget(), "Home", Icons.home),
      TabData(_profileData.getWidget(), "Profile", Icons.person),
    ];
    home = Home(this);
    layoutLoadingFinished();
  }

  layoutLoadingFinished() {
    getTheServices();
  }

  getTheServices() async {
    //Loader.shared.addLoaderToContext(context);
    List data = await SeatAvailabilityRequest().getSeatAvailabilityList();
    ServicesList services = ServicesList(data);
    groupedData = services.groupByDateAndByTime();
    updateTheChildWidgets();
   // Loader.shared.removeLoaderFromContext();
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