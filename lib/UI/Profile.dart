import 'package:flutter/material.dart';
import 'package:car_pooling/Interfaces/ProfileInterface.dart';
import 'package:car_pooling/UI/Alert.dart';
import 'package:car_pooling/UI/Login.dart';

class Profile extends StatelessWidget {
  ProfileInterface interface;
  Profile(this.interface);

  onTapProfileCell(int index) {
    Navigator.popUntil(
        interface.context, (Route<dynamic> route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    interface.context = context;
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ProfileView(interface.getEmployeeName(), interface.getEmployeeId()),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 1))),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      height: 1,
                      color: Colors.black26,
                    ),
                itemCount: interface.profileOptions.length,
                itemBuilder: (context, index) =>
                    ProfileOptions(interface.profileOptions[index], () {
                      this.onTapProfileCell(index);
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  String name;
  String age;

  ProfileView(this.name, this.age) {}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.account_circle,
              size: 100.0,
              color: Colors.black54,
            )),
        Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left),
              Text(age,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 15),
                  textAlign: TextAlign.left)
            ],
          ),
        )
      ],
    );
  }
}

class ProfileOptions extends StatelessWidget {
  String title;
  VoidCallback onTap;

  ProfileOptions(this.title, this.onTap);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50,
      child: GestureDetector(
          onTap: this.onTap,
          child: Column(children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 8,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(title,
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54)),
                      )),
                  Expanded(
                    flex: 2,
                    child: Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            ),
            Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey,
            )
          ])),
    );
  }
}
