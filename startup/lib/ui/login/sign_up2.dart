import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup/globals.dart' as globals;
import 'package:startup/services/auth.dart';
import 'package:startup/ui/login/sign_in2.dart';
import 'package:startup/ui/login/sign_up.dart';
import 'package:startup/ui/profile/profile.dart';

class SignUp2 extends StatefulWidget {
  SignUp2({Key? key}) : super(key: key);

  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
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

  /* ----ERROR HANDLING---- */

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

  void signUpErrorHandling() async {
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
      bool shouldNavigate = await signUp(
          emailController.text,
          passwordController.text,
          firstnameController.text,
          secondnameController.text);
      if (shouldNavigate) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
      }
    }
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
                /* ----TOP PICTURE PART & BACKGROUND---- */
                Stack(
                  children: [
                    /* TITLE TEXT */
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.13,
                        right: MediaQuery.of(context).size.width * 0.08,
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Get' + '\n' + 'Started!',
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  //fontFamily: 'HelveticaNeue',
                                  fontWeight: FontWeight.bold),
                            ))),

                    /* CIRCLE FORM */
                    Positioned(
                        top: MediaQuery.of(context).size.height * (-0.11),
                        left: MediaQuery.of(context).size.width * (-0.17),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          width: MediaQuery.of(context).size.width * 0.65,
                          decoration: BoxDecoration(
                              color: Colors.yellow, shape: BoxShape.circle),
                        )),

                    /* LOGO */
                    Positioned(
                        top: MediaQuery.of(context).size.height * -0.05,
                        left: MediaQuery.of(context).size.width * (-0.17),
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
                        /* ----TITLE SIGN UP---- */
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),

                        /* ----NAME TEXT & TEXTFIELD---- */
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text('Name'),
                        ),
                        TextFormField(
                          controller: firstnameController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              errorText: errorsName ? errorFirstName() : null,
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

                        /* ----SURNAME TEXT & TEXTFIELD---- */
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text('Second Name'),
                        ),
                        TextFormField(
                          controller: secondnameController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              errorText:
                                  errorsSecondName ? errorSecondName() : null,
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

                        /* ----EMAIL TEXT & TEXTFIELD---- */
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text('Email'),
                        ),
                        TextFormField(
                          controller: emailController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              errorText: errorsEmail ? errorEmail() : null,
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

                        /* ----PASSWORD TEXT & TEXTFIELD---- */
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text('Password'),
                        ),
                        TextFormField(
                          controller: passwordController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          obscureText: isPasswordHiden,
                          decoration: InputDecoration(
                              errorText: errorsPassword ? errorPass() : null,
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

                        /* ----REPEAT PASSWORD TEXT & TEXTFIELD---- */
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text('Repeat Password'),
                        ),
                        TextFormField(
                          controller: repeatpasswordController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          obscureText: isRepeatPasswordHiden,
                          decoration: InputDecoration(
                              errorText: errorsRepeatPassword
                                  ? errorRepeatPass()
                                  : null,
                              suffixIcon: IconButton(
                                  icon: isRepeatPasswordHiden
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      isRepeatPasswordHiden =
                                          !isRepeatPasswordHiden;
                                    });
                                  })),
                        ),

                        /* ----NEED HELP BUTTON---- */
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn2()),
                              );
                            },
                            child: Text('Need Help?'),
                          ),
                        ),

                        /* ----SIGN UP BUTTON---- */
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
                              signUpErrorHandling();
                            },
                            child: Text('GET STARTED'),
                          ),
                        ),

                        /* ----ICONS SIGNUP---- */
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: Text('Or Sign Up with'),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              /* GOOGLE */
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
                                        builder: (context) => SignIn2()),
                                  );
                                },
                              ),

                              /* FACEBOOK */
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
                                        builder: (context) => SignIn2()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        /* ----HAVE AN ACCOUNT BUTTON TO SIGNIN---- */
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Have an Account?',
                                style: TextStyle(fontSize: 17),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn2()),
                                    );
                                  },
                                  child: Text(
                                    'Log In',
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
