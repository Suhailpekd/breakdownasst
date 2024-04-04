// import 'package:breakdown_assist/Mechanic/Tabs/Rating%20Tab.dart';
// import 'package:breakdown_assist/Mechanic/Tabs/Request%20Tab.dart';
// import 'package:breakdown_assist/Mechanic/Tabs/Service%20Tab.dart';
import 'package:breakdown_assist/Mechanic/Mechanic_Rating.dart';
import 'package:breakdown_assist/Mechanic/Mechanic_Service.dart';
import 'package:flutter/material.dart';

import 'Mechanic_Request.dart';

class Mechanic_Service_Home extends StatefulWidget {
  const Mechanic_Service_Home({super.key});

  @override
  State<Mechanic_Service_Home> createState() => _Mechanic_Service_HomeState();
}

class _Mechanic_Service_HomeState extends State<Mechanic_Service_Home> {
  @override
  int indexNum = 0;
  List Tabs = [
    Request_Tab(),
    Mechanic_Service(),
    Mechanic_Rating(),
  ];


  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Rating',
          ),
        ],
        showUnselectedLabels: false,
        iconSize: 25,
        currentIndex: indexNum,
        onTap: (int num){
          setState(() {
            indexNum = num;
          });
        }
    ),
      body: Tabs.elementAt(indexNum),
    );
  }
}