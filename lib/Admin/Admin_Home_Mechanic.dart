import 'package:breakdown_assist/Admin/Admin_Mechanic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Admin_Home_Mechanic extends StatefulWidget {
  const Admin_Home_Mechanic({super.key});

  @override
  State<Admin_Home_Mechanic> createState() => _Admin_Home_MechanicState();
}

class _Admin_Home_MechanicState extends State<Admin_Home_Mechanic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("mechanicsignup").get(),
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
      return
      ListView.separated(
          separatorBuilder: (context, index) =>
              Divider(thickness: 5, color: Colors.white,),
          itemCount: user.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Admin_Mechanic(id: user[index].id);
                    },
                  ));
                },
                child: Card(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(height: 20,),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            "assets/images/person image.jpg"),
                        radius: 30,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(user[index]['username'], style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),),
                          Text(user[index]['phone'], style: TextStyle(
                            fontSize: 15,)),
                          Text(user[index]['experience'], style: TextStyle(
                            fontSize: 15,)),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            );
          }
      );
    }
      ),


    );
  }
}