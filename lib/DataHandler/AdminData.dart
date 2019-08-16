import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';
import 'package:car_pooling/DataHandler/DriverData.dart';
import 'package:car_pooling/UI/CustomComponentWidgets/ListViewWithCheckBox.dart';
import 'package:car_pooling/UI/PopUp.dart';

class AdminData extends DriverData implements AdminUIInterface {

  @override
  void selectedItem(int index) {
    PopUp.shared.showPopUpOnContext(context,
        ListViewWithCheckBox(
            ListViewDataHandler()
        )
    );
  }
}