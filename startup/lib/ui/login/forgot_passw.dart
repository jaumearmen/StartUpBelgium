import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup/globals.dart' as globals;
import 'package:startup/ui/login/sign_in_view.dart';

class ForgotPassw extends StatefulWidget {
  ForgotPassw({Key? key}) : super(key: key);

  @override
  _ForgotPasswState createState() => _ForgotPasswState();
}

class _ForgotPasswState extends State<ForgotPassw> {
  final _controller = TextEditingController();

  /*Future<void> recupera(String email) async {
    bool b = await UserController.recupera(email);
  }*/

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text;
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.vpn_key_sharp,
                color: globals.primary,
                size: 80.0,
              ),
              Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 20,
                  color: globals.primary,
                ),
              ),
              Text(
                'Reset description',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.backspace_rounded),
                    onPressed: () => _controller.clear(),
                  ),
                  hintText: 'Reset Email Description',
                  labelText: 'Email *',
                ),
                /* onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                }, */
                /*validator: (String value) {
                  return (value != null && !value.contains('@')) ? 'Correo inválido' : null;
                },*/
                onSubmitted: (String value) async {
                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Ty'),
                        content: Text('Reset confirm'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInView()),
                              );
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  //recupera(_controller.text);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Ty'),
                        content: Text('Reset Confirm'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInView()),
                              );
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
