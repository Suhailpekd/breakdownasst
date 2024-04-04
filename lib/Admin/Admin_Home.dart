import 'package:breakdown_assist/Admin/Admin_Home_tab.dart';
import 'package:breakdown_assist/admin/admin_notification.dart';
import 'package:breakdown_assist/admin/admin_payment.dart';
import 'package:flutter/material.dart';

class Admin_home extends StatefulWidget {
  const Admin_home({super.key});
  @override
  State<Admin_home> createState() => _Admin_homeState();
}

class _Admin_homeState extends State<Admin_home> {
  int _indexNum = 0;
  List tabs = [
    Admin_Home_tab(),
    Admin_Payment(),
    Admin_Notification(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            backgroundImage: ExactAssetImage("assets/images/person image.jpg"),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Payment",
                icon: Icon(Icons.payments),
              ),
              BottomNavigationBarItem(
                  label: "Notification", icon: Icon(Icons.notification_add))
            ],
            iconSize: 30,
            // showSelectedLabels: false,
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
