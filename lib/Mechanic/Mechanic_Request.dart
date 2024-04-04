import 'package:breakdown_assist/Mechanic/Mechanic_Accept_Tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Mechanic_Request_Tab.dart';

class Request_Tab extends StatefulWidget {
  const Request_Tab({super.key});

  @override
  State<Request_Tab> createState() => _Request_TabState();
}

class _Request_TabState extends State<Request_Tab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: Colors.blue.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular( 10),
                ),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.shade400
                    ),
                    labelPadding: EdgeInsets.symmetric(horizontal: 20),
// overlayColor: MaterialStateColor.transparent,
                    tabs: [
                      Tab(child: Text("Request",style: TextStyle(fontSize: 20,color: Colors.black),),),
                      Tab(child: Text("Accept",style: TextStyle(fontSize: 20,color: Colors.black)),),
                    ]
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Expanded(
              child: TabBarView(
                  children: [
                    Mechanic_Request_Tab(),
                    Mechanic_Accept_Tab(),

                  ]),
            ),
          ],
        ),


      ),
    );
  }
}