import 'package:flutter/material.dart';
import 'package:car_pooling/UI/PopUp.dart';

abstract class AddServiceUIInterface {
  String nameOfService;
  addNewService() {}
}

class AddServiceData implements AddServiceUIInterface {

  @override
  String nameOfService = "";

  @override
  addNewService() {
    // TODO: implement addNewService
    PopUp.shared.removePopUpFromContext();
  }
}

class AddService extends StatefulWidget {

  AddServiceUIInterface interface;
  AddService(this.interface);
  @override
  State createState() {
    return _AddServiceState();
  }
}

class _AddServiceState extends State<AddService> {

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height* 0.3,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.directions_car,
                          color: Colors.black,
                        ),
                        labelText: "Add Servive",
                        disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black54
                            )
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black
                            )
                        )
                    ),
                  ),
                ),
                FlatButton(
                  child: Text("Add"),
                  onPressed: () {
                    setState(() {
                      widget.interface.nameOfService = controller.text;
                      widget.interface.addNewService();
                    });
                  },
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}