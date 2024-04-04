import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_Mechanic_Detail extends StatefulWidget {
  const User_Mechanic_Detail({super.key, required this.id});
  final id;

  @override
  State<User_Mechanic_Detail> createState() => _User_Mechanic_DetailState();
}

class _User_Mechanic_DetailState extends State<User_Mechanic_Detail> {

  @override
  void initState() {
    // TODO: implement initState
    getSavedData();
    super.initState();
  }
  var ID = '';
  Future<void>getSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    ID = prefs.getString('id')!;
    setState(() {

    });
  }

  final date = new DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  String dropdownvalue = 'select service';



  var items = [
    'select service',
    'engine service',
    'oil change',
    'fuel',
    'ac repair',
    'puncherwork',
  ];

  DocumentSnapshot? mech;

  getdata()async{
    mech = await FirebaseFirestore.instance
        .collection('mechanicsignup')
        .doc(widget.id)
        .get();
    getuser();
    print("get mech");
  }

   DocumentSnapshot? user;

  getuser()async{
    user = await FirebaseFirestore.instance
        .collection('usersignup')
        .doc(ID)
        .get();
    print("get user");
  }

  var location = TextEditingController();

  Future<dynamic> mechreq() async {
    print("process firebae");
    await FirebaseFirestore.instance.collection('mechreq').add({

      "location":location.text,
      "work": dropdownvalue,
      "time": time.format(context),
      "date": DateFormat('dd/MM/yyyy').format(date),
      "payment": 0,
      "status": 0,
      "userid":ID,
      "userprofile": user!['path'],
      "mechanicprofile": mech!['path'],
      "username": user!['username'],
      "mechusername": mech!['username'],
      "userphone": user!['phone'],
      "mechPhone": mech!['phone'],
      "mechid": widget.id,

    });
    print("Success");

    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text("Needed Service"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getdata(),
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
        
        
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(
                              "assets/images/person image.jpg"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(mech!['username'], style: TextStyle(fontSize: 20),),
                        SizedBox(
                          height: 10,
                        ),
                        Text(mech!['phone'], style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(mech!['experience'], style: TextStyle(fontSize: 20),),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white),
                            color: Colors.green.shade400,
                          ),
                          child: Text("Available",
                            style: TextStyle(color: Colors.white, fontSize: 15),),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 130, 0),
                          child: Text("Add Needed Service",
                              style: TextStyle(fontSize: 20)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: DropdownButton(
        
                                  value: dropdownvalue,
        
                                  icon: const Icon(Icons.keyboard_arrow_down),
        
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                      print(dropdownvalue);
                                    });
                                  },
                                ),
        
                              ),
                            ),
        
                            IconButton(onPressed: () {},
                                icon: Icon(
                                    size: 35,
                                    Icons.add_circle_rounded))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 250, 0),
                          child: Text("Place", style: TextStyle(fontSize: 20),),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: TextFormField(
                              controller: location,
                              style: TextStyle(fontSize: 20),
                              maxLines: 5,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Place"
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(180, 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white
                            ),
                            onPressed: () {
                              mechreq();
                            },
                            child: Text("Request",
                              style: TextStyle(fontSize: 20),))
                      ],
                    ),
                  );
                },
              ),
      ),
          );



  }
}