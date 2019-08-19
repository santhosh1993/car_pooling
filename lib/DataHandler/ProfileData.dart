import 'package:car_pooling/UI/Profile.dart';
import 'package:flutter/material.dart';
import 'package:car_pooling/Interfaces/ProfileInterface.dart';

class ProfileData implements ProfileInterface {

  @override
  Map<String, Object> _userDetails = {
    "firstName": "Suneelkumar",
    "secondName": "Gavara",
    "employeeId": 548431
  };
  @override
  List<String> profileOptions = [
    "Edit Profile",
    "Booking History",
    "Help"
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
    var employeeId = _userDetails["employeeId"] as int;
    return "${employeeId}";
  }

  @override
  String getEmployeeName() {

    var firstName = _userDetails["firstName"] as String;
    var secondName = _userDetails["secondName"] as String;
    return firstName + " " + secondName;
  }
}