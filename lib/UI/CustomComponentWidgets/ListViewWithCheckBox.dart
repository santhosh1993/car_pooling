import 'package:flutter/material.dart';
import 'package:car_pooling/UI/CustomWidgets/TextWithCheckBox.dart';
import 'package:car_pooling/Model/TitleWithSelection.dart';

abstract class ListViewWithCheckBoxUIHandler {
  List<TitleWithSelectionInterface> listOfEmployees;
  onTapItem(int index);
}

class ListViewDataHandler extends ListViewWithCheckBoxUIHandler {

  List<TitleWithSelectionInterface> listOfEmployees = [
    TitleWithSelection(false, "SuneelKumar Gavara", 548431),
    TitleWithSelection(false, "Santhosh Nampally", 512131),
    TitleWithSelection(false, "Swathi Rout", 543123),
    TitleWithSelection(false, "Bharath Ram", 544666)
  ];
  @override
  onTapItem(int index) {
    listOfEmployees[index].onSelection();
  }
}

class ListViewWithCheckBox extends StatefulWidget {

  ListViewWithCheckBoxUIHandler interface;
  ListViewWithCheckBox(this.interface);

  _ListViewWithCheckBoxState createState(){
    return _ListViewWithCheckBoxState();
  }
}

class _ListViewWithCheckBoxState extends State<ListViewWithCheckBox> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: widget.interface.listOfEmployees.length,
              itemBuilder: (context, index) {
                TitleWithSelection selection = widget.interface.listOfEmployees[index];
                return TextWithCheckBox(selection.isSelected,
                        (){
                      setState(() {
                        widget.interface.onTapItem(index);
                      });
                    },
                    selection.title);
              },
            ),
            flex: 8,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue
                    ),
                    child: FlatButton(
                        child: Text("Drop", style: TextStyle(
                          color: Colors.white
                        ),)
                    ),
                  ),
                  flex: 5,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue
                    ),
                    child: FlatButton(
                      child: Text("Cancel", style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                    ),
                  ),
                  flex: 5,
                )
              ],
            ),
            flex: 2,
          )
        ],
      )
    );
  }
}