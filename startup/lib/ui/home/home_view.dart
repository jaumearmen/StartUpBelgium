import 'package:flutter/material.dart';
import 'package:startup/ui/widgets/event_item.dart';
import 'package:startup/globals.dart' as globals;
import 'package:startup/ui/widgets/menu_item.dart';
import 'package:startup/ui/widgets/menu_items.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PopupMenuItem<MenuItem> buildItem(MenuItem item) =>
      PopupMenuItem(child: Text(item.text));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 30),
                  constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                  child: Image(
                    image: AssetImage('assets/images/logo_app.png'),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Search ...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Icon(Icons.menu),
                  /*child: PopupMenuButton<MenuItem>(
                    itemBuilder: (context) =>
                        [...MenuItems.itemsFirst.map(buildItem).toList()],
                  ),*/
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: EventItem(
              image: 'assets/images/disco1.jpg',
              location: 'Viaduct-dam 104',
              hour: '12:00',
              title: 'Secret Basement Party',
            ),
          ),
        ],
      ),
    );
  }
}
