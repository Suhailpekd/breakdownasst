import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Admin_Mechanic extends StatefulWidget {
  const Admin_Mechanic({super.key,required this.id});
final id;
  @override
  State<Admin_Mechanic> createState() => _Admin_MechanicState();
}

class _Admin_MechanicState extends State<Admin_Mechanic> {
  DocumentSnapshot? user;
  getData() async {
    user = await FirebaseFirestore.instance
        .collection('mechanicsignup')
        .doc(widget.id)
        .get();
  }

  void accept(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection("mechanicsignup")
          .doc(id)
          .update({'status': 1});
    });
  }

  void reject(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection("mechanicsignup")
          .doc(id)
          .update({'status': 2});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
        body: SingleChildScrollView(
      child: Center(
        child: FutureBuilder(
      future: getData(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Text("Error${snapshot.error}");
      }
    return
      Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 60
        ),
        child: Container(
          height: 1000,
          width: 340,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        "assets/images/person image.jpg"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(user?["username"], style: TextStyle(fontSize: 19),),
                  Text("Location", style: TextStyle(fontSize: 19),),
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
                    child: Text("Username", style: TextStyle(fontSize: 18),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: user?["username"],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      "Phone number", style: TextStyle(fontSize: 18),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: user?["phone"],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      "Email address", style: TextStyle(fontSize: 18),),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: user?["email"],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      "Work experience", style: TextStyle(fontSize: 18),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: user?["experience"],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      "Work shop name", style: TextStyle(fontSize: 18),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: user?["shopname"],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SizedBox(
              //       height: 10,
              //     ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      "Your location", style: TextStyle(fontSize: 18),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "Enter your location"
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child:user?['status'] == 0? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            backgroundColor: Colors.green.shade300,
                            foregroundColor: Colors.white
                        ),
                        onPressed: () {
                          accept(widget.id);
                        },
                        child: Text("Accept", style: TextStyle(fontSize: 20))),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            backgroundColor: Colors.red.shade300,
                            foregroundColor: Colors.white
                        ),
                        onPressed: () {
                          reject(widget.id);
                        },
                        child: Text("Reject", style: TextStyle(fontSize: 20),)),
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
              ),

            ],
          ),

        ),
      );
    },
        ),
        ),
      ),
        );

  }
}