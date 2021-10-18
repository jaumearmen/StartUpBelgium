import 'package:flutter/material.dart';
import 'package:startup/ui/widgets/login_buble.dart';
import 'package:startup/globals.dart' as globals;

class Testing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //body: LoginBubble(),
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
            child: Stack(
              children: [
                Stack(
                  children: [
                    Positioned(
                        top: 170,
                        left: 25,
                        child: Text(
                          'Welcome' + '\n' + 'Back!',
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              //fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.bold),
                        )),
                    Positioned(
                        top: 80,
                        right: -60,
                        child: Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.orange, shape: BoxShape.circle),
                        )),
                    Positioned(
                        top: 0,
                        right: -30,
                        child: Container(
                          constraints:
                              BoxConstraints(maxHeight: 370, maxWidth: 370),
                          child: Image.asset('assets/images/logo_app.png'),
                        )),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 500,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.0))),
                  ),
                ),
              ],
            )));
  }
}
