import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mechanic_Notification extends StatefulWidget {
  const Mechanic_Notification({super.key});

  @override
  State<Mechanic_Notification> createState() => _Mechanic_NotificationState();
}

class _Mechanic_NotificationState extends State<Mechanic_Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade50,
          title: Text(
            "Notification",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: FirebaseFirestore.instance.collection('Notification').get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              final _notification = snapshot.data?.docs ?? [];
              return ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        thickness: 5,
                        color: Colors.white,
                      ),
                  itemCount: _notification.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all()),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(_notification[index]['matter'],
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(_notification[index]['time']),
                                )
                              ],
                            ),

                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 280,
                                    child: Text(_notification[index]['content'],
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                ),
                              ],
                            ),
                            Row(mainAxisAlignment:MainAxisAlignment.end ,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(_notification[index]['date']),
                                )
                              ],
                            )
                          ]),
                        ));
                  });
            }));
  }
}
