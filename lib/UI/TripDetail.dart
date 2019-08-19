import 'package:flutter/material.dart';
import 'package:car_pooling/Interfaces/TripDetailInterfaces.dart';

class TripDetail extends StatefulWidget {
  TripDetailUIInterface interface;
  List<String> _items = ["Santhosh","Santhosh","Santhosh","Santhosh","Santhosh","Santhosh","Santhosh","Santhosh","Santhosh","Santhosh","Santhosh","Santhosh","Santhosh","Santhosh","Santhosh","Santhosh",];

  TripDetail(this.interface);

  @override
  State<StatefulWidget> createState() {
    return TripDetailState();
  }
}

class TripDetailState extends State<TripDetail> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.value = TextEditingValue(text: "100");
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
            "Trip Detail",
            style: TextStyle(color: Colors.white),
      ),
      ),
      body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5),
              width: double.infinity,
              child: TextField(
                controller: _controller,
                  decoration: InputDecoration(
                    labelText: "max bookings",
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              width: double.infinity,
              child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "Total bookings",
                  )
              ),
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text("List of Booked Users"),
            ),
            getSeparator(),
            Expanded(
              child: Container(
               child: getList(),
            )
            ),
            getSeparator(),
            Container(
              margin: EdgeInsets.all(10.0),
              height: 50.0,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: FlatButton(onPressed: (){

              }, child: Text("Button", style: TextStyle(color: Colors.white),)),
            )
          ],
        ),
      );
  }

  Widget getSeparator(){
    return Container(
      height: 2,
      width: double.infinity,
      color: Colors.grey,
    );
  }
  Widget getList() {
    if (widget._items.length > 0) {
      return ListView.builder(
          itemCount: widget._items.length,
          itemBuilder: (context, index) {
            return SelectionListTile(widget._items[index]);
          });
    }
  }
}


class SelectionListTile extends StatefulWidget{
  String name;
  bool isSelected = false;

  SelectionListTile(String name){
    this.name = name;
  }

  @override
  State<StatefulWidget> createState() {
    return SelectionListTileState();
  }
}

class SelectionListTileState extends State<SelectionListTile> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        height: 60,
        margin: EdgeInsets.all(0),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    child:Icon((widget.isSelected) ? Icons.check_box : Icons.check_box_outline_blank, color: Colors.black54,),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10.0,right: 10.0),
                      child: Text(widget.name, textAlign: TextAlign.left),
                    ),
                  ),
                  Container(
                    height: 58,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10.0,right: 10.0),
                    child: Text("548326", textAlign: TextAlign.left),
                  )
                ],
              ),
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.grey,
            )
          ],
        ),
      ),
      onPressed: (){
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
      },
    );
  }
}