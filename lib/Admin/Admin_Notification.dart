// import 'package:breakdown_assist/Admin/Admin_Add_Notification.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class Admin_Notification extends StatefulWidget {
//   const Admin_Notification({super.key});
//
//   @override
//   State<Admin_Notification> createState() => _Admin_home_userState();
// }
//
// class _Admin_home_userState extends State<Admin_Notification> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => Admin_Add_Notification()),
//             );
//           },
//           child: Icon(Icons.add),
//         ),
//         body: SingleChildScrollView(
//           child: FutureBuilder(
//               future:
//                   FirebaseFirestore.instance.collection("Notification").get(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 if (snapshot.hasError) {
//                   return Center(
//                     child: Text("Error:${snapshot.error}"),
//                   );
//                 }
//                 final _notification = snapshot.data?.docs ?? [];
//                 return ListView.separated(
//                     separatorBuilder: (context, index) => Divider(
//                           thickness: 5,
//                           color: Colors.white,
//                         ),
//                     itemCount: 5,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         height: 130,
//                         width: 100,
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text('k',
//                                   // _notification[index]["matter"],
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 Spacer(),
//                                 // Text(_notification[index]['date']),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 // Text(_notification[index]["content"]),
//                                 Spacer(),
//                                 // Text(_notification[index]['time']),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     });
//               }),
//         ));
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Admin_Add_Notification.dart';

class Admin_Notification extends StatefulWidget {
  const Admin_Notification({super.key});

  @override
  State<Admin_Notification> createState() => _Admin_NotificationState();
}

class _Admin_NotificationState extends State<Admin_Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Admin_Add_Notification()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("Notification").get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final user = snapshot.data?.docs ?? [];
          return ListView.builder(
            itemCount: user.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  color: Colors.blue.shade100,
                  child: Column(
                    children: [
                      Text(user[index]['content']),
                      Text(user[index]['matter']),

                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
