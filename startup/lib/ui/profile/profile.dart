import 'package:flutter/material.dart';
import 'package:startup/services/auth.dart';
import 'package:startup/ui/login/sign_in2.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(color: Colors.blue),
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    bool shouldNavigate = await signOut();
                    if (shouldNavigate) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn2()),
                      );
                    }
                  },
                  child: Text(
                    'SIGN OUT',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    bool shouldNavigate = await deleteAccount();
                    if (shouldNavigate) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn2()),
                      );
                    }
                  },
                  child: Text(
                    'Delete account',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
