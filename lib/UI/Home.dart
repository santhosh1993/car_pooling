import 'package:flutter/material.dart';
import 'package:car_pooling/UI/DateHeader.dart';
import 'package:car_pooling/Interfaces/HomeScreenInterfaces.dart';

class Home extends StatefulWidget{
  HomeUIInterface interface;
  List<BottomNavigationBarItem> _tabs = [];
  List<Widget> _tabViews = [];
  int _selectedIndex = 0;

  Home(HomeUIInterface interface) {
    this.interface = interface;

    for(int i =0; i< interface.tabsData.length ; i++) {
      _tabs.add(
          BottomNavigationBarItem(
            title: Text(interface.tabsData[i].title),
            icon: Icon(interface.tabsData[i].iconData),
          )
      );
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
          backgroundColor: Color.fromRGBO(107, 198, 211, 1.0),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: widget._tabs,
          currentIndex: widget._selectedIndex,
            onTap: (int index) {
              setState(() {
                widget._selectedIndex = index;
              });
            }
        ),
        body: Container(
          child: widget._tabViews[widget._selectedIndex],
        ),
    )
    );
  }
}

class DashBoard extends StatefulWidget {
  DashBoardUIInterface interface;
  DashBoard(this.interface);

  List<DashBoardListTileInterface> _items = [];

  @override
  State<StatefulWidget> createState() {
    return DashBoardState();
  }
}

class DashBoardState extends State<DashBoard> implements DateHeaderUIInterface, DashboardUICallback{

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
    widget.interface.context = context;
    widget.interface.callback = this;

    return Column(children: <Widget>[
      DateHeader(this),
      Expanded(
        child: getList(),
      ),
    ]);
  }

  Widget getList() {
    if (widget._items.length > 0) {
      return ListView.builder(
          itemCount: widget._items.length,
          itemBuilder: (context, index) {
            return DashBoardListTile(widget._items[index]);
          });
    }
    return Center(
      child: Text("No Data available...."),
    );
  }

  @override
  updateData(List<DashBoardListTileInterface> items) {
    setState(() {
      widget._items = items;
    });
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
