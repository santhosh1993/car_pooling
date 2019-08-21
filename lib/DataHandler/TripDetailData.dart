import 'package:flutter/material.dart';
import 'package:car_pooling/UI/TripDetail.dart';
import 'package:car_pooling/Model/Service.dart';
import 'package:car_pooling/Interfaces/TripDetailInterfaces.dart';
import 'package:car_pooling/Model/User.dart';
import 'package:car_pooling/UI/Alert.dart';
import 'package:car_pooling/ServiceLayer/SeatAvailabilityRequest.dart';

class TripDetailData implements TripDetailUIInterface, SeatBookingUpdateInterface {
  TripDetail detail;
  Service _service;
  bool isAdmin = (User.shared.userType.toLowerCase() == "a");
  @override
  TripDetailUICallBack callBack;
  @override
  BuildContext context;
  List<TripDetailListTileData> tilesData = [];
  @override
  List<int> bookingIds = [];

  @override
  String type = 'delete';

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
    String title = "";
    String message = "";
    if (isAdmin){
      title = "Drop out";
      message = "Would you like to delete the users from the trip";
    }
    else{
        title = "Turned up";
        message = "Would you like to start the trip with the selected users";
    }

    List<FlatButton> buttons = [
      FlatButton(
        onPressed: (){
          if(isAdmin){
            dropOutTheSelectedUsers();
          }
          else{
            turnedUpTheUsers();
          }
          Navigator.pop(context);
        },
        child: Text("OK"),
      ),
      FlatButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Text("Cancel"),
      )
    ];
    AlertHandler.showAlertOnContext(context, SimpleAlertData(title, message, buttons));
  }

  dropOutTheSelectedUsers() async{
    type = "delete";
    var updatedTilesData = tilesData.where((tileData) => tileData.isSelected).toList();
    bookingIds = [];
    for(int i = 0; i<updatedTilesData.length;i++) {
      bookingIds.add(int.parse(updatedTilesData[i].details.bookingId));
    }
    Map data = await SeatAvailabilityRequest().updateTheBooking(this);
    if(data["status_code"] == 2002) {
      tilesData = tilesData.where((tileData) => !tileData.isSelected).toList();
      _service.bookedUsers = [];
      for(int i =0 ; i<tilesData.length; i++) {
        _service.bookedUsers.add(tilesData[i].details);
      }
    }
    callBack.updateList(tilesData);
  }

  turnedUpTheUsers() async {
    type = "turned_up";
    var updatedTilesData = tilesData.where((tileData) => tileData.isSelected).toList();
    bookingIds = [];
    for(int i = 0; i<updatedTilesData.length;i++) {
      bookingIds.add(int.parse(updatedTilesData[i].details.bookingId));
    }
    Map data = await SeatAvailabilityRequest().updateTheBooking(this);
    if(data["status_code"] == 2002) {
      Navigator.pop(context);
    }
    callBack.updateList(tilesData);
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

  UserDetails details;

  TripDetailListTileData(UserDetails userDetails) {
    empID = userDetails.employeeId;
    name = userDetails.userName;
    details = userDetails;
  }

}