import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Admin_User extends StatefulWidget {
  const Admin_User({super.key, required this.id});
  final id;
  @override
  State<Admin_User> createState() => _Admin_UserState();
}

class _Admin_UserState extends State<Admin_User> {
  DocumentSnapshot? user;
  getData() async {
    user = await FirebaseFirestore.instance
        .collection('usersignup')
        .doc(widget.id)
        .get();
  }

  void accept(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection("usersignup")
          .doc(id)
          .update({'status': 1});
    });
  }

  void reject(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection("usersignup")
          .doc(id)
          .update({'status': 2});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("Error${snapshot.error}");
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 700,
                  width: 340,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  AssetImage("assets/images/person image.jpg"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              user?["username"],
                              style: TextStyle(fontSize: 19),
                            ),
                            Text(
                              "Location",
                              style: TextStyle(fontSize: 19),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(
                              "Username",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: user?["username"]),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(
                              "Phone number",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: user?["phone"]),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(
                              "Email address",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: user?["email"]),
                        ),
                      ),
                      user?['status'] == 0? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 150,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  backgroundColor: Colors.green.shade300,
                                  foregroundColor: Colors.white),
                              onPressed: () {
                                accept(widget.id);
                              },
                              child: Text("Accept",
                                  style: TextStyle(fontSize: 20))),
                          SizedBox(
                            width: 75,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  backgroundColor: Colors.red.shade300,
                                  foregroundColor: Colors.white),
                              onPressed: () {
                                reject(widget.id);
                              },
                              child: Text(
                                "Reject",
                                style: TextStyle(fontSize: 20),
                              )),
                        ],
                      ):user?['status'] == 1? Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Accepted",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                          ),
                        ),
                      ):Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Rejected",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // ),
    );
  }
}
