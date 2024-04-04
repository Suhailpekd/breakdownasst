import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_Mechanic_Request_List extends StatefulWidget {
  const User_Mechanic_Request_List({super.key});

  @override
  State<User_Mechanic_Request_List> createState() => _User_Mechanic_Request_ListState();
}

class _User_Mechanic_Request_ListState extends State<User_Mechanic_Request_List> {

  void initState() {
    // TODO: implement initState
    getSavedData();
    super.initState();
    getSavedData();
  }
  var ID = '';
  Future<void>getSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();




    ID = prefs.getString('id')!;
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("mechreq").where('userid', isEqualTo:ID ).get(),
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
      final mech = snapshot.data?.docs ?? [];
      return ListView.separated(
          separatorBuilder: (context, index) =>
              Divider(thickness: 5, color: Colors.white,),
          itemCount: mech.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Card(
                color: Colors.blue.shade200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(mech[index]['mechusername'],
                            style: TextStyle(fontSize: 15)),
                        Text(mech[index]['date'],
                            style: TextStyle(fontSize: 15)),
                        Text(mech[index]['time'],
                            style: TextStyle(fontSize: 15)),
                        Text(mech[index]['work'],
                          style: TextStyle(fontSize: 15),),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text(
                      "Approved", style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                    //

                  ],
                ),
              ),
            );
          }
      );
    },
      ),
    );
  }
}