import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';
import 'package:car_pooling/DataHandler/DriverData.dart';
import 'package:car_pooling/UI/Admin.dart';
import 'package:flutter/material.dart';

class AdminData extends DriverData implements AdminUIInterface {
  Admin admin;

  AdminData() {
    admin = Admin(this);
  }

  Widget getWidget() {
    return admin;
  }
  @override
  void selectedItem(int index) {

  }
}