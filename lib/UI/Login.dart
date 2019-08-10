import 'package:flutter/material.dart';

abstract class LoginUIInterface {
  String userName;
  String password;
  BuildContext context;
  void loginButtonTapped();
}

class Login extends StatefulWidget {
  final LoginUIInterface interface;

  Login(this.interface);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState(interface);
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginUIInterface interface;

  LoginState(this.interface);
  // Login Action
  void loginButtonTapped() {
    setState(() {
      interface.userName = _userController.text;
      interface.password = _passwordController.text;
      interface.loginButtonTapped();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    interface.context = context;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Picture.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                height: 400.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "images/epam.png",
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5.0,right: 42.0),
                    child: CustomTextField(
                        _userController, "User Name", Icons.person, false),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0,right: 42.0,top: 10.0),
                    child: CustomTextField(
                        _passwordController, "Password", Icons.lock, true),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 30.0),
                    height: 46.0,
                    width: double.infinity,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0)),
                      onPressed: () {
                        loginButtonTapped();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController _controller;
  final String _hintText;
  final IconData _iconData;
  final bool _obscureText;

  CustomTextField(
      this._controller, this._hintText, this._iconData, this._obscureText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      style: TextStyle(color: Colors.white),
      controller: _controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
          labelText: _hintText,
          icon: Icon(
            _iconData,
            color: Colors.white70,
          ),
          labelStyle: TextStyle(color: Colors.white70),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white70)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
