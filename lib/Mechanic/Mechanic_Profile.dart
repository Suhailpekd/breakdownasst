import 'package:breakdown_assist/Mechanic/Mechanic_Home.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mechanic_Edit_Profile.dart';

class Mechanic_Profile extends StatefulWidget {
  const Mechanic_Profile({super.key});

  @override
  State<Mechanic_Profile> createState() => _Mechanic_ProfileState();
}

class _Mechanic_ProfileState extends State<Mechanic_Profile> {
  @override
  void initState() {
    // TODO: implement initState
    getSavedData();
    super.initState();
  }

  var ID = '';

  Future<void> getSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ID = prefs.getString('id')!;
    print("get from sp");
    setState(() {

    });
  }

  late DocumentSnapshot mech;
  getupdateddata() async {
    mech = await FirebaseFirestore.instance
        .collection('mechanicsignup')
        .doc(ID)
        .get();
    print("get from fb");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getupdateddata(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }

        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 320),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Mech_Edit_profile()),
                          );
                        },
                        icon: Icon(
                          Icons.edit_calendar_outlined,
                          color: Colors.black,
                        )),
                  ),
                  mech!['path']==""?
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: ExactAssetImage("assets/images/person image.jpg"),
                  ):
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        NetworkImage(mech["path"]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: mech["username"],
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: mech?['phone'],
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: mech!['email'],
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: mech!['experience'],
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: mech!['shopname'],
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: " Location",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Mechanic_Home()),
                        );
                      },
                      child: Text(
                        "Done",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
