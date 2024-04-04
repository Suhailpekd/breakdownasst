
import 'package:flutter/material.dart';

import 'User_Mechanic_List.dart';
import 'User_Profile.dart';
import 'User_Request_Mechanic_List.dart';
class User_home extends StatefulWidget {
  const User_home({super.key});

  @override
  State<User_home> createState() => _User_homeState();
}

class _User_homeState extends State<User_home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade100,
          leading: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return User_Profile();
                },
              ));
            },
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/person image.jpg"),
            ),
          ),
          title: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            height: 35,
            width: 200,

            child: TextFormField(
              decoration: InputDecoration(


                hintText: " search",
                prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search,)),


                border: InputBorder.none,

              ),
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){}, icon:Icon(Icons.notification_add,color: Colors.amber,))
          ],
        ),


        bottomSheet: TabBar(tabs: [Tab(child: Text("Mechanic"),
        ),
          Tab(child:Text("Request") ,)
        ]),
        body:  TabBarView(children: [
          User_Mechanic_List(),
          User_Mechanic_Request_List(),
        ]),
      ),
    );
  }
}
