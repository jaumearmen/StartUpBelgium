import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup/globals.dart' as globals;
import 'package:startup/ui/login/sign_in_view.dart';
import 'package:startup/services/auth.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  final firstnameController = TextEditingController();
  final secondnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatpasswordController = TextEditingController();

  bool isPasswordHiden = true;
  bool isRepeatPasswordHiden = true;

  bool errorsName = false;
  bool errorsSecondName = false;
  bool errorsEmail = false;
  bool errorsPassword = false;
  bool errorsRepeatPassword = false;
  bool errorsAll = false;

  String errorFirstName() {
    if (firstnameController.text.isEmpty) return "Empty Field";
    return "";
  }

  String errorSecondName() {
    if (secondnameController.text.isEmpty) return "Empty Field";
    return "";
  }

  String errorEmail() {
    if (emailController.text.isEmpty)
      return "Empty Field";
    else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) {
      return "The email has not a vaild format";
    }
    return "";
  }

  String errorPass() {
    if (passwordController.text.isEmpty)
      return "Empty Field";
    else if (passwordController.text.length < 6)
      return "Password is too short";
    else if (passwordController.text.length > 20)
      return "Password is too long";
    else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~?.,_-]).{6,}$')
        .hasMatch(passwordController.text)) {
      return "The password must contain at least \none majuscule, one minuscule, a number and a symbol";
    }
    return "";
  }

  String errorRepeatPass() {
    if (repeatpasswordController.text.isEmpty)
      return "Empty Field";
    else if (repeatpasswordController.text != passwordController.text) {
      return "The passwords does not match";
    }
    return "";
  }

  bool disposed = false;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    disposed = true;
    firstnameController.dispose();
    secondnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(40, 120, 40, 40),
        children: [
          Container(
            constraints: BoxConstraints.expand(height: 160),
            child: Image.asset(
              'assets/images/logo_app.png',
            ),
          ),
          Container(
              constraints: BoxConstraints.expand(height: 50),
              margin: EdgeInsets.only(top: 20),
              child: Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.redAccent,
                ),
                child: TextFormField(
                  controller: firstnameController,
                  onChanged: (text) {
                    setState(() {});
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'First Name',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 4),
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(30)),
                      errorText: errorsAll ? errorFirstName() : null,
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: firstnameController.text.isEmpty
                          ? Container(
                              width: 0,
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.clear,
                              ),
                              onPressed: () {
                                setState(() {
                                  firstnameController.clear();
                                });
                              })),
                ),
              )),
          Container(
              constraints: BoxConstraints.expand(height: 50),
              margin: EdgeInsets.only(top: 20),
              child: Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.redAccent,
                ),
                child: TextFormField(
                  controller: secondnameController,
                  onChanged: (text) {
                    setState(() {});
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Second Name',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 4),
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(30)),
                      errorText: errorsAll ? errorSecondName() : null,
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: secondnameController.text.isEmpty
                          ? Container(
                              width: 0,
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.clear,
                              ),
                              onPressed: () {
                                setState(() {
                                  secondnameController.clear();
                                });
                              })),
                ),
              )),
          Container(
              constraints: BoxConstraints.expand(height: 50),
              margin: EdgeInsets.only(top: 20),
              child: Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.redAccent,
                ),
                child: TextFormField(
                  controller: emailController,
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
                      errorText: errorsAll ? errorEmail() : null,
                      prefixIcon: Icon(Icons.email),
                      suffixIcon: emailController.text.isEmpty
                          ? Container(
                              width: 0,
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.clear,
                              ),
                              onPressed: () {
                                setState(() {
                                  emailController.clear();
                                });
                              })),
                ),
              )),
          Container(
              margin: EdgeInsets.only(top: 20),
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
                    errorText: errorsAll ? errorPass() : null,
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
              margin: EdgeInsets.only(top: 20),
              constraints: BoxConstraints.expand(height: 50),
              child: TextFormField(
                controller: repeatpasswordController,
                onChanged: (text) {
                  setState(() {});
                },
                obscureText: isRepeatPasswordHiden,
                decoration: InputDecoration(
                    labelText: 'Repeat Password',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 4),
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    errorText: errorsAll ? errorRepeatPass() : null,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: isRepeatPasswordHiden
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            isRepeatPasswordHiden = !isRepeatPasswordHiden;
                          });
                        })),
              )),
          Container(
              height: 40,
              margin: EdgeInsets.only(top: 40),
              child: ElevatedButton(
                  child: Text('Sign up',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  style: ElevatedButton.styleFrom(
                      primary: globals.yellow1,
                      onPrimary: Colors.black,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                  onPressed: () async {
                    setState(() {
                      if (errorFirstName() != "")
                        errorsName = true;
                      else
                        errorsName = false;
                      if (errorSecondName() != "")
                        errorsSecondName = true;
                      else
                        errorsSecondName = false;
                      if (errorEmail() != "")
                        errorsEmail = true;
                      else
                        errorsEmail = false;
                      if (errorPass() != "")
                        errorsPassword = true;
                      else
                        errorsPassword = false;
                      if (errorRepeatPass() != "")
                        errorsRepeatPassword = true;
                      else
                        errorsRepeatPassword = false;
                      errorsAll = errorsName |
                          errorsSecondName |
                          errorsEmail |
                          errorsPassword |
                          errorsRepeatPassword;
                    });
                    if (!errorsAll) {
                      /*dynamic result = await _auth.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInView()),
                      );*/
                    }
                  })),
        ],
      ),
    );
  }
}
