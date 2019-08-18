import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';
import 'package:flutter/material.dart';
import 'package:car_pooling/UI/Driver.dart';
import 'package:car_pooling/Model/Service.dart';

class DriverData implements DriverUIInterface {
  int selectedIndex = 0;
  List<String> dateStrList = ["05 / 09 / 19","06 / 09 / 19","07 / 09 / 19","08 / 09 / 19"];
  List<List<String>> timingsList = [["05: 30 pm" , "06: 30 pm"],["06: 30 pm"],["07: 30 pm" , "08: 30 pm"],[]];
  Widget driver;

  DriverData() {
      driver = Driver(this);
  }

  updateData(Map<String,Map<String,List<Service>>> groupedData) {
    updateVariables(groupedData);
  }

  updateVariables(Map<String,Map<String,List<Service>>> services) {
    
  }

    Widget getWidget(){
    return driver;
  }
  
  @override
  List<String> get timings => timingsList[selectedIndex];

  @override
  String get dateStr => dateStrList[selectedIndex];

  @override
  set dateStr(String _dateStr) {
    // TODO: implement dateStr
  }

  @override
  set timings(List<String> _timings) {
    // TODO: implement timings
  }

  @override
  void leftTapped() {
    if(selectedIndex != 0){
      selectedIndex = selectedIndex - 1;
    }
  }

  @override
  void rightTapped() {
    if(selectedIndex != (dateStrList.length - 1)){
      selectedIndex = selectedIndex + 1;
    }
  }

  @override
  List<PeopleListItemInterface> getListOfPeople() {
    // TODO: implement getListOfPeople
    return [];
  }

  @override
  void selectedItem(int index) {
    print(index);
  }

}