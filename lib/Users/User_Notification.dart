import 'package:flutter/material.dart';

class User_Notification extends StatefulWidget {
  const User_Notification({super.key});

  @override
  State<User_Notification> createState() => _User_NotificationState();
}

class _User_NotificationState extends State<User_Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade50,
          title: Text("Notification", style: TextStyle(fontSize: 30),),
          centerTitle: true,
        ),
        body: ListView.separated(
            separatorBuilder: (context,index)=> Divider(thickness: 5,color: Colors.white,),
            itemCount: 1,
            itemBuilder: (BuildContext context,int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                  ),
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Admin Notification",style: TextStyle(fontSize: 20),),
                          SizedBox(
                            width: 40,
                          ),
                          Text("Time",style: TextStyle(fontSize: 15),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(260, 40, 0, 0),
                        child: Text("Date",style: TextStyle(fontSize: 15),),
                      ),
                    ],
                  ),
                ),
              );
            }
        )
    );
  }
}