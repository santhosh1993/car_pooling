import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';
import 'package:car_pooling/Model/TitleWithSelection.dart';
import 'package:car_pooling/UI/PopUp.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:car_pooling/UI/CustomComponentWidgets/ListViewWithCheckBox.dart';

class DriverData implements DriverUIInterface {

  int selectedIndex = 0;
  List<String> dateStrList = ["05 / 09 / 19","06 / 09 / 19","07 / 09 / 19","08 / 09 / 19"];
  List<List<String>> timingsList = [["05: 30 pm" , "06: 30 pm"],["06: 30 pm"],["07: 30 pm" , "08: 30 pm"],[]];

  @override
  BuildContext context;

  @override
  List<String> get timings => timingsList[selectedIndex];

  @override
  String get dateStr => dateStrList[selectedIndex];

  @override
  set dateStr(String _dateStr) {
    // TODO: implement dateStr
  }

  @override
  set timings(List<String> _timings) {
    // TODO: implement timings
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

  @override
  List<PeopleListItemInterface> getListOfPeople() {
    // TODO: implement getListOfPeople
    return [];
  }

  @override
  selectedItem(int index) {
    PopUp.shared.showPopUpOnContext(context,
        ListViewWithCheckBox(ListViewDataHandler())
    );
  }

  @override
  List<TitleWithSelection> studentDetails = [
    TitleWithSelection(false, "SuneelKumar Gavara", 548431),
    TitleWithSelection(false, "Santhosh Nampammy", 512131),
    TitleWithSelection(false, "Swathi Rout", 544345),
    TitleWithSelection(false, "Manish Tiwari", 564765)
  ];

  @override
  void selectionTitle(int index) {
    TitleWithSelection model = studentDetails[index];
    model.isSelected = !model.isSelected;
  }

}

