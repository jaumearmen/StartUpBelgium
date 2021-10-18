import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup/globals.dart' as globals;
import 'package:startup/ui/login/forgot_passw.dart';
import 'package:startup/ui/login/sign_up.dart';

class SignInView extends StatefulWidget {
  SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordHiden = true;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(40, 120, 40, 0),
        children: [
          Container(
            constraints: BoxConstraints.expand(height: 160),
            child: Image.asset(
              'assets/images/logo_app.png',
            ),
          ),
          Container(
              constraints: BoxConstraints.expand(height: 50),
              margin: EdgeInsets.only(top: 40),
              child: Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.redAccent,
                ),
                child: TextFormField(
                  controller: usernameController,
                  onChanged: (text) {
                    setState(() {});
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 4),
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(30)),
                      prefixIcon: Icon(Icons.email),
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
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              constraints: BoxConstraints.expand(height: 50),
              child: TextFormField(
                controller: passwordController,
                onChanged: (text) {
                  setState(() {});
                },
                obscureText: isPasswordHiden,
                decoration: InputDecoration(
                    labelText: 'Password',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 4),
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: isPasswordHiden
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            isPasswordHiden = !isPasswordHiden;
                          });
                        })),
              )),
          Container(
              height: 40,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  child: Text('Sign in',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  style: ElevatedButton.styleFrom(
                      primary: globals.yellow1,
                      onPrimary: Colors.black,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                  onPressed: () {
                    /*setState(() {
                        if (errorUserName() != null)
                          errorsUserName = true;
                        else
                          errorsUserName = false;
                        /*if (errorPass() != null)
                          errorsPass = true;
                        else
                          errorsPass = false;*/
                        error = errorsUserName | errorsPass;
                      });
                      if (!error) {
                        postlogin(usernameController.text,passwordController.text).then((value) {
                          //falta comprovar contraseña
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainView()),
                          );
                        });
                      }*/
                  })),
          Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                TextButton(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPassw()),
                      );
                    }),
                TextButton(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    })
              ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                child: Image.asset(
                  'assets/images/google-64.png',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                child: Image.asset(
                  'assets/images/facebook2.png',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
