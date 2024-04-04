import 'package:breakdown_assist/Mechanic/Mechanic_Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Mechanic_Notification.dart';
import 'Mechanic_Rating.dart';
import 'Mechanic_Request.dart';
import 'Mechanic_Service_Home.dart';
import 'Mechanic_Service.dart';

class Mechanic_Home extends StatefulWidget {
  const Mechanic_Home({super.key});

  @override
  State<Mechanic_Home> createState() => _Mechanic_HomeState();
}

class _Mechanic_HomeState extends State<Mechanic_Home> {
  int _indexNum = 0;
  List tabs = [
    Request_Tab(),
    Mechanic_Service(),
    Mechanic_Rating(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Mechanic_Profile();
                },
              ));
            },
            child: CircleAvatar(
              backgroundImage:
                  ExactAssetImage("assets/images/person image.jpg"),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Mechanic_Notification()),
                  );
                },
                icon: Icon(Icons.notification_add_outlined))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: "Request",
                icon: Icon(Icons.person_search),
              ),
              BottomNavigationBarItem(
                label: "Service",
                icon: Icon(Icons.miscellaneous_services),
              ),
              BottomNavigationBarItem(
                  label: "Rating",
                  icon: Icon(Icons.eighteen_up_rating_outlined))
            ],
            iconSize: 25,
            currentIndex: _indexNum,
            onTap: (int index) {
              setState(() {
                _indexNum = index;
              });
            }),
        body: tabs.elementAt(_indexNum),
      ),
    );
  }
}
