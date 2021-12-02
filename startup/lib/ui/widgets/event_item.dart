import 'package:flutter/material.dart';
import 'package:startup/ui/profile/profile2.dart';

class EventItem extends StatelessWidget {
  final String image;
  final String hour;
  final String location;
  final String title;

  const EventItem({
    required this.image,
    required this.hour,
    required this.location,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
        ),
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /* ----IMAGE EVENT---- */
            Container(
              margin: EdgeInsets.only(right: 10),
              constraints: BoxConstraints(maxHeight: 75, maxWidth: 150),
              child: Image(
                image: AssetImage(image),
              ),
            ),

            /* ----INFO EVENT---- */
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* TITLE */
                    Container(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    /* LOCATION */
                    Row(
                      children: [
                        SizedBox(
                          child: Icon(Icons.location_on),
                        ),
                        Container(
                          child: Text(location),
                        ),
                      ],
                    ),

                    /* TIME */
                    Row(
                      children: [
                        Container(
                          child: Icon(Icons.timer),
                        ),
                        Container(
                          child: Text(hour),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile2()),
        );
      },
    );
  }
}
