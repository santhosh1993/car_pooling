import 'package:flutter/material.dart';
import 'package:car_pooling/UI/DateHeader.dart';
import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';

class Home extends StatefulWidget{
  HomeUIInterface interface;
  List<Tab> _tabs = [];
  List<Widget> _tabViews = [];

  Home(HomeUIInterface interface) {
    this.interface = interface;

    for(int i =0; i< interface.tabsData.length ; i++) {
      _tabs.add(Tab(
        child: Text(interface.tabsData[i].title,style: TextStyle(color:  Colors.white),),
      ));
      _tabViews.add(interface.tabsData[i].tabView);
    }
  }

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.interface.tabsData.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
          bottom: TabBar(tabs: widget._tabs),
          backgroundColor: Color.fromRGBO(107, 198, 211, 1.0),
        ),
        body: TabBarView(children: widget._tabViews),
    )
    );
  }
}

class DashBoard extends StatefulWidget {
  DashBoardUIInterface interface;
  DashBoard(this.interface);

  @override
  State<StatefulWidget> createState() {
    return DashBoardState();
  }
}

class DashBoardState extends State<DashBoard> implements DateHeaderUIInterface{

  @override
  String get dateStr => widget.interface.dateStr;

  @override
  set dateStr(String _dateStr) {}

  @override
  void leftTapped() {
    setState(() {
      widget.interface.leftTapped();
    });
  }

  @override
  void rightTapped() {
    setState(() {
      widget.interface.rightTapped();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateHeader(this),
      Expanded(
        child: ListView.builder(
            itemCount: widget.interface.items.length,
            itemBuilder: (context, index) {
              return DashBoardListTile(widget.interface.items[index]);
            }),
      ),
    ]);
  }
}

class DashBoardListTile extends StatefulWidget {
  DashBoardListTileInterface interface;

  DashBoardListTile(this.interface);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashBoardListTileState();
  }
}

class DashBoardListTileState extends State<DashBoardListTile> {

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
                    widget.interface.time,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Container(
                  height: 30.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.interface.names.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.only(left: 10.0),
                            color: (widget.interface.selectedIndex == index)
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                                side: BorderSide(
                                    color: (widget.interface.selectedIndex == index)
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.interface.selectedName(index);
                                });
                              },
                              child: Text(
                                widget.interface.names[index],
                                style: TextStyle(
                                    color: (widget.interface.selectedIndex == index)
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ));
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
