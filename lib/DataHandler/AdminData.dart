import 'package:car_pooling/UI/Home.dart';

class AdminData implements AdminUIInterface {
  int selectedIndex = 0;
  List<String> dateStrList = ["05 / 09 / 19","06 / 09 / 19","07 / 09 / 19","08 / 09 / 19"];
  
  @override
  String get dateStr => dateStrList[selectedIndex];

  @override
  set dateStr(String _dateStr) {
    // TODO: implement dateStr
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

}