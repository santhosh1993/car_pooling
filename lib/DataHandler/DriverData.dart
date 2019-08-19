import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';
import 'package:flutter/material.dart';
import 'package:car_pooling/UI/Driver.dart';
import 'package:car_pooling/Model/Service.dart';
import 'package:car_pooling/DataHandler/DashBoardData.dart';

class DriverData extends DashBoardData implements DriverUIInterface {

  Widget driver;

  DriverData() {
      driver = Driver(this);
  }

  @override
  Widget getWidget() {
    return driver;
  }

}