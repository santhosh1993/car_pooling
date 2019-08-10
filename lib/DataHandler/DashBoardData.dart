import 'package:car_pooling/UI/Dashboard.dart';

class DashBoardData implements DashBoardUIInterface{

  @override
  String dateStr = "05 / 09 / 19";

  @override
  List<DashBoardListTileInterface> items = [
    DashBoardTileData(1),
    DashBoardTileData(-1),DashBoardTileData(0),DashBoardTileData(-1),DashBoardTileData(-1),
    DashBoardTileData(0),DashBoardTileData(-1),DashBoardTileData(1),DashBoardTileData(0),
    DashBoardTileData(-1),DashBoardTileData(-1),DashBoardTileData(1),DashBoardTileData(0),
    DashBoardTileData(-1),DashBoardTileData(-1),DashBoardTileData(0),DashBoardTileData(1),
  ];

  @override
  void leftTapped() {
    // TODO: implement leftTapped
    dateStr = "04 / 09 / 19";
  }

  @override
  void rightTapped() {
    // TODO: implement rightTapped
    dateStr = "07 / 09 / 19";
  }
}

class DashBoardTileData implements DashBoardListTileInterface {
  @override
  List<String> names = ["Metro", "MMTS"];

  @override
  String time = "05:30 pm";

  @override
  int selectedIndex;

  DashBoardTileData(this.selectedIndex);

  @override
  void selectedName(int index) {
    selectedIndex = (selectedIndex == index) ? -1 : index;
  }
}