import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup/globals.dart' as globals;
import 'package:startup/ui/login/sign_up.dart';
import 'package:startup/ui/login/sign_up2.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn2 extends StatefulWidget {
  SignIn2({Key? key}) : super(key: key);

  @override
  _SignIn2State createState() => _SignIn2State();
}

class _SignIn2State extends State<SignIn2> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordHiden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //body: LoginBubble(),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [globals.yellow_background1, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              //stops: [0.5, 1]
            )),
            child: Stack(
              children: [
                Stack(
                  children: [
                    Positioned(
                        top: 130,
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
                    padding: EdgeInsets.fromLTRB(35, 5, 35, 35),
                    height: 550,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.0))),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
                          child: Text('Email'),
                        ),
                        TextFormField(
                          controller: usernameController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              /*focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 4),
                                  borderRadius: BorderRadius.circular(30)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.circular(30)),*/
                              //prefixIcon: Icon(Icons.email),
                              suffixIcon: usernameController.text.isEmpty
                                  ? Container(
                                      width: 0,
                                    )
                                  : IconButton(
                                      icon: Icon(
                                        Icons.clear,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          usernameController.clear();
                                        });
                                      })),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                          child: Text('Password'),
                        ),
                        TextFormField(
                          controller: passwordController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          obscureText: isPasswordHiden,
                          decoration: InputDecoration(
                              /*focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 4),
                                  borderRadius: BorderRadius.circular(30)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.circular(30)),*/
                              //prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  icon: isPasswordHiden
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      isPasswordHiden = !isPasswordHiden;
                                    });
                                  })),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp2()),
                              );
                            },
                            child: Text('Need Help?'),
                          ),
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              gradient: LinearGradient(
                                  colors: [
                                    globals.yellow_background1,
                                    Colors.black
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: [0.3, 1])),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp2()),
                              );
                            },
                            child: Text('PROCEED'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: Text('Or Log In Using Email'),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxHeight: 50, maxWidth: 50),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                  ),
                                  child:
                                      Image.asset('assets/images/google2.png'),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp2()),
                                  );
                                },
                              ),
                              InkWell(
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxHeight: 50, maxWidth: 50),
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                  ),
                                  child: Image.asset('assets/images/face1.png'),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp2()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'New?',
                                style: TextStyle(fontSize: 17),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp2()),
                                    );
                                  },
                                  child: Text(
                                    'Create Account',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
