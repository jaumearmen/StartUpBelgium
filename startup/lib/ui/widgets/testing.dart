import 'package:flutter/material.dart';
import 'package:startup/ui/widgets/login_buble.dart';
import 'package:startup/globals.dart' as globals;

class Testing extends StatefulWidget {
  Testing({Key? key}) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [globals.yellow_background1, Colors.black87],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        //stops: [0.5, 1]
      )),
      child: ListView(
        children: [
          Container(
            child: Text('Hello World!'),
          )
        ],
      ),
    ));
  }
}
