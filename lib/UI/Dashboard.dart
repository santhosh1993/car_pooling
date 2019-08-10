import 'package:flutter/material.dart';

abstract class DashBoardUIInterface {
  List<DashBoardListTileInterface> items;
  String dateStr;
  void leftTapped();
  void rightTapped();
}

abstract class DashBoardListTileInterface {
  String time;
  List<String> names;
  int selectedIndex;
  void selectedName(int index);
}

class DashBoard extends StatefulWidget {
  DashBoardUIInterface interface;

  DashBoard(this.interface);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashBoardState(this.interface);
  }
}

class DashBoardState extends State<DashBoard> {
  DashBoardUIInterface interface;

  DashBoardState(this.interface);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Dashboard",
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(107, 198, 211, 1.0),
        ),
        body: Column(
            children: <Widget>[
              Container(
                height: 50.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(onPressed: (){
                      setState(() {
                        interface.leftTapped();
                      });
                    }, child: Text("<"), padding: EdgeInsets.all(10.0),),
                    Text(this.interface.dateStr),
                    FlatButton(onPressed: (){
                      setState(() {
                        interface.rightTapped();
                      });
                    }, child: Text(">"), padding: EdgeInsets.all(10.0),),
                  ],
                ),
              ),
              Container(
                color: Colors.grey,
                height: 2.0,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: interface.items.length,
                    itemBuilder: (context, index) {
                      return DashBoardListTile(interface.items[index]);
                    }
                ),
              )
    ]
        )
    );
  }
}

class DashBoardListTile extends StatefulWidget {
  DashBoardListTileInterface interface;

  DashBoardListTile(this.interface);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashBoardListTileState(this.interface);
  }
}

class DashBoardListTileState extends State<DashBoardListTile> {
  DashBoardListTileInterface interface;

  DashBoardListTileState(this.interface);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            height: 100.0,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    interface.time,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Container(
                  height: 30.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: interface.names.length,
                      itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 10.0),
                        color: (interface.selectedIndex == index) ? Theme.of(context).primaryColor : Colors.white,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(color: (interface.selectedIndex == index) ? Theme.of(context).primaryColor: Colors.grey),
                          ),
                          onPressed: () {
                          setState(() {
                            interface.selectedName(index);
                          });
                        }, child: Text(interface.names[index], style: TextStyle(color:  (interface.selectedIndex == index) ? Colors.white: Colors.black),),
                      )
                    );
                  }),
                )
              ],
            ),
          ),
          Container(
            height: 2.0,
            width: double.infinity,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
