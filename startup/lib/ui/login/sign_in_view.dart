import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup/globals.dart' as globals;

class SignInView extends StatefulWidget {
  SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordHiden = true;

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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.black),
                  ),
                  /*onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Reset()),
                      );
                    }*/
                ),
                TextButton(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );*/
                    })
              ]))
        ],
      ),
    );
  }
}
