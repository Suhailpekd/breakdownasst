import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mechanic_Service_Accept_Reject extends StatefulWidget {
  const Mechanic_Service_Accept_Reject({super.key, required this.id});
  final id;

  @override
  State<Mechanic_Service_Accept_Reject> createState() => _Mechanic_Service_Accept_RejectState();
}

class _Mechanic_Service_Accept_RejectState extends State<Mechanic_Service_Accept_Reject> {

  DocumentSnapshot? user;
  getData() async {
    user = await FirebaseFirestore.instance
        .collection('mechreq')
        .doc(widget.id)
        .get();
  }

  void accept(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection("mechreq")
          .doc(id)
          .update({'status': 1});
    });
  }

  void reject(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection("mechreq")
          .doc(id)
          .update({'status': 2});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      return Container(
        height: 550,
        width: 330,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue.shade50
        ),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/person image.jpg"),
            ),
            Text(user?['username'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Problem", style: TextStyle(fontSize: 16),),
                        Text("Place", style: TextStyle(fontSize: 16),),
                        Text("Date", style: TextStyle(fontSize: 16),),
                        Text("Time", style: TextStyle(fontSize: 16),),
                        Text("Contact number", style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user!['work'], style: TextStyle(fontSize: 16),),
                        Text(user!['location'],
                          style: TextStyle(fontSize: 16),),
                        Text(user!['date'], style: TextStyle(fontSize: 16),),
                        Text(user!['time'], style: TextStyle(fontSize: 16),),
                        Text(user!['userphone'], style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                )
              ],
            ),

            SizedBox(
              height: 70,
            ), user?['status'] == 0? Row(
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
                child: Text("Accepted",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
              ),
            ):Container(
              decoration: BoxDecoration(
                  color: Colors.red
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Rejected",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
              ),
            )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //             backgroundColor: Colors.green.shade300,
            //             foregroundColor: Colors.white,
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10))
            //         ),
            //         onPressed: () {},
            //         child: Text("Accept", style: TextStyle(fontSize: 20),)),
            //     ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //             backgroundColor: Colors.red.shade300,
            //             foregroundColor: Colors.white,
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10))
            //         ),
            //         onPressed: () {},
            //         child: Text("Reject", style: TextStyle(fontSize: 20),))
            //   ],
            // )
          ],
        ),
      );
    }
        ),
      ),
    );
  }
}