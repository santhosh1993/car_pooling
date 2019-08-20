import 'package:flutter/material.dart';

abstract class ProfileInterface {
  BuildContext context;
  Map<String, Object> _userDetails;
  String getEmployeeName();
  String getEmployeeId();
  List<String> profileOptions;
}
