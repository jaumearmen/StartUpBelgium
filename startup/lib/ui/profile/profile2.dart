import 'package:flutter/material.dart';
import 'package:startup/globals.dart' as globals;
import 'package:startup/ui/home/home_view.dart';

class Profile2 extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),*/
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: globals.yellow_background1,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            /* ----PROFILE INFO---- */
            Container(
              padding: EdgeInsets.fromLTRB(35, 5, 35, 5),
              height: MediaQuery.of(context).size.height * 0.68,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30.0))),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Hi Johnson!',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Name',
                      style: TextStyle(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Johnson Doe',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'Email',
                      style: TextStyle(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'johson@gmail.com',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextButton(
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView()),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),

            /* ----IMAGE---- */
            Positioned(
              top: MediaQuery.of(context).size.height * -(0.17),
              left: MediaQuery.of(context).size.width * 0.24,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                //child: Image.asset('assets/images/profile_icon.png'),
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.25,
                  backgroundImage:
                      AssetImage('assets/images/profile_image.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
