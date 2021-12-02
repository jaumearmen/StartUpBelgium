import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup/globals.dart' as globals;
import 'package:startup/services/auth.dart';
import 'package:startup/ui/login/sign_up.dart';
import 'package:startup/ui/login/sign_up2.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:startup/ui/profile/profile.dart';
import 'package:startup/ui/profile/profile2.dart';

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
              colors: [globals.yellow_background1, Colors.yellow],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              //stops: [0.5, 1]
            )),
            child: Stack(
              children: [
                /* ----TOP PICTURE PART---- */
                Stack(
                  children: [
                    /* WELCOME TEXT */
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.13,
                        left: MediaQuery.of(context).size.width * 0.08,
                        child: Text(
                          'Welcome' + '\n' + 'Back!',
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              //fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.bold),
                        )),

                    /* CIRCLE SHAPE */
                    Positioned(
                        top: MediaQuery.of(context).size.height * (-0.11),
                        right: MediaQuery.of(context).size.width * (-0.17),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          width: MediaQuery.of(context).size.width * 0.65,
                          decoration: BoxDecoration(
                              color: Colors.yellow, shape: BoxShape.circle),
                        )),

                    /* LOGO */
                    Positioned(
                        top: MediaQuery.of(context).size.height * -0.05,
                        right: MediaQuery.of(context).size.width * (-0.12),
                        child: Container(
                          constraints: BoxConstraints(
                              maxHeight:
                                  (MediaQuery.of(context).size.height * 0.65),
                              maxWidth:
                                  (MediaQuery.of(context).size.width * 0.65)),
                          child: Image.asset('assets/images/logo_app.png'),
                        )),
                  ],
                ),

                /* ----TEXT FIELDS PART---- */
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(35, 5, 35, 5),
                    height: MediaQuery.of(context).size.height * 0.73,
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
                          margin: EdgeInsets.only(top: 15),
                          child: Text('Email'),
                        ),

                        /* ----EMAIL TEXTFIELD---- */
                        TextFormField(
                          controller: usernameController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
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
                          margin: EdgeInsets.only(top: 15),
                          child: Text('Password'),
                        ),

                        /* ----PASWORD TEXTFIELD---- */
                        TextFormField(
                          controller: passwordController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          obscureText: isPasswordHiden,
                          decoration: InputDecoration(
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

                        /* ----NEED HELP BUTTON---- */
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text('Need Help?',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),

                        /* ----PROCEED BUTTON---- */
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
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
                            onPressed: () async {
                              bool shouldNavigate = await signIn(
                                  usernameController.text,
                                  passwordController.text);
                              if (shouldNavigate) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile2()),
                                );
                              }
                            },
                            child: Text(
                              'PROCEED',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        /* ----ICONS TO LOG IN---- */
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              /* GOOGLE ICON */
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
                                onTap: () {},
                              ),

                              /* FACEBOOK ICON */
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
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),

                        /* ----SIGN UP BUTTON---- */
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
