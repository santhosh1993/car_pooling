import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';
import 'package:flutter/material.dart';
import 'package:car_pooling/UI/Home.dart';
import 'package:car_pooling/ServiceLayer/SeatAvailabilityRequest.dart';
import 'package:car_pooling/UI/Loader.dart';
import 'package:car_pooling/Model/User.dart';
import 'package:car_pooling/Model/Service.dart';

class DashBoardData implements DashBoardUIInterface, SeatAvailabilityRequestInterface{

  DashBoard dashboard;

  @override
  BuildContext context;

  int selectedIndex = 0;
  List<String> dateStrList = [];

  List<List<DashBoardTileData>> listOfItems = [];
  @override
  DashboardUICallback callback;

  @override
  String get dateStr {
    if (dateStrList.length > selectedIndex) {
      return dateStrList[selectedIndex];
    }
    return "";
  }

  DashBoardData() {
    dashboard = DashBoard(this);
    updateData();
  }

  updateData() async {
    List data = await SeatAvailabilityRequest(this).getSeatAvailabilityList();
    ServicesList services = ServicesList(data);
    Map<String,Map<String,List<Service>>> groupedData = services.groupByDateAndByTime();
    updateVariables(groupedData);
    callback.updateData(listOfItems[selectedIndex]);
  }

  updateVariables(Map<String,Map<String,List<Service>>> services){
    List<String> keys = services.keys.toList();

    keys.sort((str1,str2) {
      return str1.compareTo(str2);
    });

    dateStrList = keys;

    for (int i = 0 ;i<keys.length; i++) {
      Map timesServices = services[keys[i]];
      List<String> timeKeys = timesServices.keys.toList();
      timeKeys.sort((str1,str2) {
        return str1.compareTo(str2);
      });
      List<DashBoardTileData> list = [];

      for (int j = 0 ; j < timeKeys.length; j++) {
        list.add(DashBoardTileData(timesServices[timeKeys[j]], timeKeys[j]));
      }

      listOfItems.add(list);
    }

    print(listOfItems);
  }

  Widget getWidget() {
    return dashboard;
  }

  @override
  set dateStr(String _dateStr) {
    // TODO: implement dateStr
  }

  @override
  void leftTapped() {
    // TODO: implement leftTapped
    if(selectedIndex != 0){
      selectedIndex = selectedIndex - 1;
      callback.updateData(listOfItems[selectedIndex]);
    }
  }

  @override
  void rightTapped() {
    // TODO: implement rightTapped
    if(selectedIndex != (dateStrList.length - 1)){
      selectedIndex = selectedIndex + 1;
      callback.updateData(listOfItems[selectedIndex]);
    }
  }
}

class DashBoardTileData implements DashBoardListTileInterface {
  @override
  List<String> names = [];

  @override
  String time;

  @override
  int selectedIndex = -1;
  
  List<Service> _services;
  
  DashBoardTileData(List<Service> services, String time){
    this.time = time;
    this._services = services;

    this._services.sort((service_1,service_2) {
      return service_1.type.serviceType.compareTo(service_2.type.serviceType);
    });

    names = [];
    for(int i = 0 ; i < services.length; i++) {
      if (User.shared.bookedServices.contains(services[i])){
          selectedIndex = i;
      }
      names.add(services[i].type.serviceType);
    }
    names = services.map((service) {
      return service.type.serviceType;
    }).toList();
  }

  @override
  void selectedName(int index) {
    selectedIndex = (selectedIndex == index) ? -1 : index;
  }
}