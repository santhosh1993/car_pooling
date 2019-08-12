import 'package:car_pooling/UI/Home.dart';
import 'package:flutter/material.dart';

class DashBoardData implements DashBoardUIInterface{
  @override
  BuildContext context;

  int selectedIndex = 0;
  List<String> dateStrList = ["05 / 09 / 19","06 / 09 / 19","07 / 09 / 19","08 / 09 / 19"];

  List<List<DashBoardListTileInterface>> listOfItems = [[
    DashBoardTileData(1,"05:30 pm"),
    DashBoardTileData(-1,"06:30 pm"),
  ],[
    DashBoardTileData(1,"05:45 pm"),
  ],[
    DashBoardTileData(0,"05:50 pm"),
    DashBoardTileData(-1,"05:55 pm"),
  ],[
  ]];
  @override
  String get dateStr => dateStrList[selectedIndex];
  @override
  List<DashBoardListTileInterface>  get items {
    return listOfItems[selectedIndex];
  }

  @override
  set dateStr(String _dateStr) {
    // TODO: implement dateStr
  }

  @override
  set items(List<DashBoardListTileInterface> _items) {
    // TODO: implement items
  }

  @override
  void leftTapped() {
    // TODO: implement leftTapped
    if(selectedIndex != 0){
      selectedIndex = selectedIndex - 1;
    }
  }

  @override
  void rightTapped() {
    // TODO: implement rightTapped
    if(selectedIndex != (dateStrList.length - 1)){
      selectedIndex = selectedIndex + 1;
    }
  }
}

class DashBoardTileData implements DashBoardListTileInterface {
  @override
  List<String> names = ["Metro", "MMTS"];

  @override
  String time;

  @override
  int selectedIndex;

  DashBoardTileData(this.selectedIndex,this.time);

  @override
  void selectedName(int index) {
    selectedIndex = (selectedIndex == index) ? -1 : index;
  }
}