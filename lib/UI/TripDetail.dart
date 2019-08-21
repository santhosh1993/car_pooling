import 'package:flutter/material.dart';
import 'package:car_pooling/Interfaces/TripDetailInterfaces.dart';

class TripDetail extends StatefulWidget {
  final TextEditingController _maxBookingcontroller = TextEditingController();
  final TextEditingController _totalBookingcontroller = TextEditingController();
  TripDetailUIInterface interface;
  List<TripDetailListTileInterface> _items = [];

  TripDetail(TripDetailUIInterface interface, List<TripDetailListTileInterface> items) {
    this.interface = interface;
    _items = items;
    updateControllerValues();
  }

  updateControllerValues() {
    _maxBookingcontroller.value =
        TextEditingValue(text: interface.maxBookings.toString());
    _totalBookingcontroller.value =
        TextEditingValue(text: interface.totalBookings.toString());
  }

  @override
  State<StatefulWidget> createState() {
    return TripDetailState();
  }
}

class TripDetailState extends State<TripDetail> implements TripDetailUICallBack {

  TripDetailState(){

  }

  @override
  updateList(List<TripDetailListTileInterface> items) {
      setState(() {
        widget._items = items;
      });
  }

  @override
  Widget build(BuildContext context) {
    widget.interface.callBack = this;
    widget.interface.context = context;
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
            margin: EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
            width: double.infinity,
            child: TextField(
                enabled: widget.interface.isMaxBookingEditable,
                controller: widget._maxBookingcontroller,
                decoration: InputDecoration(
                  labelText: "max bookings",
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
            width: double.infinity,
            child: TextField(
                enabled: false,
                controller: widget._totalBookingcontroller,
                decoration: InputDecoration(
                  labelText: "Total bookings",
                )),
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
          )),
          getSeparator(),
          Container(
            margin: EdgeInsets.all(10.0),
            height: 50.0,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: FlatButton(
                onPressed: () {
                  widget.interface.buttonTapped();
                },
                child: Text(
                  widget.interface.buttonTitle,
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }

  Widget getSeparator() {
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

class SelectionListTile extends StatefulWidget {
  TripDetailListTileInterface interface;

  SelectionListTile(TripDetailListTileInterface interface) {
    this.interface = interface;
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
                    child: Icon(
                      (widget.interface.isSelected)
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: Colors.black54,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Text(widget.interface.name, textAlign: TextAlign.left),
                    ),
                  ),
                  Container(
                    height: 58,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(widget.interface.empID, textAlign: TextAlign.left),
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
      onPressed: () {
        setState(() {
          widget.interface.isSelected = !widget.interface.isSelected;
        });
      },
    );
  }
}
