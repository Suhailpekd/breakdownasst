
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mechanic_Service extends StatefulWidget {
  const Mechanic_Service({super.key});

  @override
  State<Mechanic_Service> createState() => _Mechanic_ServiceState();
}

class _Mechanic_ServiceState extends State<Mechanic_Service> {
  var servicectrl = TextEditingController();

  void delete(id){
    FirebaseFirestore.instance
        .collection('services')
        .doc(id)
        .delete()
        .then((value) {
          setState(() {});
    }).catchError((error){
      print("failed to delete service: $error");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmechdetails();
  }

  var ID = '';

  void getmechdetails() async {
    final mechservice = await SharedPreferences.getInstance();

    ID = mechservice.getString('id')!;

    setState(() {});
  }

  final _key = GlobalKey<FormState>();

  final Snack =
  SnackBar(duration: Duration(seconds: 3), content: Text("Service added"));

  Future<dynamic> Submitservice() async {
    await FirebaseFirestore.instance
        .collection('services')
        .add({'service': servicectrl.text, 'mechid': ID}).then((value) {
      Navigator.pop(context);
      servicectrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                backgroundColor: Colors.blue.shade200,
                title: Center(
                  child: Text("Add service"),
                ),
                titleTextStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                content: SizedBox(
                  height: 200,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: _key,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Required';
                            }
                            return null;
                          },
                          controller: servicectrl,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.blue.shade200))),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              Submitservice();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(Snack);
                            }
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ));
        },
        child: Icon(size: 50, Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text(
          "Services",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: Card(
            color: Colors.lightBlue.shade50,
            child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('services')
                    .where('mechid', isEqualTo: ID)
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  final serv = snapshot.data?.docs ?? [];
                  return ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      itemCount: serv.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            serv[index]['service'],
                            style: TextStyle(fontSize: 20),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              delete(serv[index].id);
                            },
                            icon: Icon(Icons.delete),
                            iconSize: 30,
                          ),
                        );
                      });
                }),
          ),
        ),
      ),
    );
  }
}