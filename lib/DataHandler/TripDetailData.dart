import 'package:flutter/material.dart';
import 'package:car_pooling/UI/TripDetail.dart';
import 'package:car_pooling/Model/Service.dart';
import 'package:car_pooling/Interfaces/TripDetailInterfaces.dart';
import 'package:car_pooling/Model/User.dart';

class TripDetailData implements TripDetailUIInterface {
  TripDetail detail;
  Service _service;
  bool isAdmin = (User.shared.userType.toLowerCase() == "a");
  @override
  TripDetailUICallBack callBack;
  @override
  BuildContext context;
  List<TripDetailListTileData> tilesData = [];

  TripDetailData(Service service) {
    this._service = service;
    updateTitlesData();
    detail = TripDetail(this, tilesData);
  }

  updateTitlesData() {
    List userDetails = this._service.bookedUsers;
    for(int i = 0; i < userDetails.length ; i++) {
      tilesData.add(TripDetailListTileData(userDetails[i]));
    }
  }

  Widget getWidget() {
    return detail;
  }

  @override
  String get buttonTitle {
    return (isAdmin) ? "Drop Out" : "Turned Up";
  }

  @override
  bool get isMaxBookingEditable {
    return isAdmin;
  }

  @override
  int get maxBookings {
    return _service.maxBookings;
  }

  @override
  int get totalBookings {
    return _service.bookedUsers.length;
  }

  @override
  buttonTapped() {
    var updatedTilesData = tilesData.where((tileData) => !tileData.isSelected).toList();
    callBack.updateList(updatedTilesData);
  }

  @override
  set buttonTitle(String _buttonTitle) {}

  @override
  set isMaxBookingEditable(bool _isMaxBookingEditable) {}

  @override
  set maxBookings(int _maxBookings) {}

  @override
  set totalBookings(int _totalBookings) {}
}

class TripDetailListTileData implements TripDetailListTileInterface{
  @override
  String empID;

  @override
  bool isSelected = false;

  @override
  String name;

  TripDetailListTileData(UserDetails userDetails) {
    empID = userDetails.employeeId;
    name = userDetails.userName;
  }

}