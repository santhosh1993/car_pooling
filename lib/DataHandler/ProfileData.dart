import 'package:car_pooling/UI/Profile.dart';
import 'package:flutter/material.dart';
import 'package:car_pooling/Interfaces/ProfileInterface.dart';
import 'package:car_pooling/Model/User.dart';

class ProfileData implements ProfileInterface {

  @override
  BuildContext context;

  @override
  Map<String, Object> _userDetails = {
    "firstName": "Suneelkumar",
    "secondName": "Gavara",
    "employeeId": 548431
  };
  @override
  List<String> profileOptions = [
    "Log Out",
  ];

  Profile profile;

  ProfileData() {
    profile = Profile(this);
  }

  Widget getWidget() {
    return profile;
  }

  @override
  String getEmployeeId() {
    return User.shared.employeeId;
  }

  @override
  String getEmployeeName() {
    return User.shared.userName;
  }
}