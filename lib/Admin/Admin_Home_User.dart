import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Admin_User.dart';

class Admin_Home_User extends StatefulWidget {
  const Admin_Home_User({super.key});
  @override
  State<Admin_Home_User> createState() => _Admin_Home_UserState();
}

class _Admin_Home_UserState extends State<Admin_Home_User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("usersignup").get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.white,
            ),
            itemCount: user.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Admin_User(id: user[index].id);
                      },
                    ));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/person image.jpg"),
                          radius: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  user[index]['username'],
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(user[index]['location'],
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                              ],
                            ),

                            Text(user[index]['phone'],
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            Text(user[index]['email'],
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            SizedBox(
                              height: 15,
                            ),
                          ],

                        ),
                        Spacer(),
                        user[index]['status']==0?
                        ElevatedButton(onPressed: () {}, child: Text("Pending"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        ):user[index]['status']==1?
                        ElevatedButton(onPressed: () {}, child: Text("Accepted"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        ):ElevatedButton(onPressed: () {}, child: Text("Rejected"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
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
