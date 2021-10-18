import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup/globals.dart' as globals;

class SignIn2 extends StatefulWidget {
  SignIn2({Key? key}) : super(key: key);

  @override
  _SignIn2State createState() => _SignIn2State();
}

class _SignIn2State extends State<SignIn2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    globals.yellow_background1,
                    globals.yellow_background2
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 1])),
          child: Column(
            children: [
              /*Container(
                decoration: BoxDecoration(color: Colors.cyan),
                margin: EdgeInsets.only(left: 300),
                child: Image.asset('assets/images/logo_app.png'),
              ),*/
              Container(
                color: Colors.green,
                height: 200,
              ),
              Expanded(
                child: Container(
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30.0))),
                  child: Text('Child'),
                ),
              ),
            ],
          )),
    );
  }
}
