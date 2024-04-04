

import 'package:breakdown_assist/Mechanic/Mechanic_Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mechanic_Signup extends StatefulWidget {
  const Mechanic_Signup({super.key});

  @override
  State<Mechanic_Signup> createState() => _Mechanic_SignupState();
}

class _Mechanic_SignupState extends State<Mechanic_Signup> {
  final _formkey=GlobalKey<FormState>();
  var username = TextEditingController();
  var location = TextEditingController();
  var number = TextEditingController();
  var email = TextEditingController();
  var experience = TextEditingController();
  var shopname = TextEditingController();
  var password = TextEditingController();
  Future<dynamic> mechanicsignup() async {
    await FirebaseFirestore.instance.collection('mechanicsignup').add({
      "username": username.text,
      "location": location.text,
      "phone": number.text,
      "email": email.text,
      "experience": experience.text,
      "shopname": shopname.text,
      "password": password.text,
      "path":"",
      "status":0
    }).then((value) {
      print("Success");
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Mechanic_Login();
        },
      ));
      print("Signup Success");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90,

                  ),
                  SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset("assets/images/repair_image.png")),
                  SizedBox(
                    height: 30,
                  ),
                  Text("SIGN UP",
                    style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 220),
                    child: Text("Enter Username",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller:  username,
                      validator: (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'Please enter username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 220),
                    child: Text("Enter Location",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller:  location,
                      validator: (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'Please enter your location';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Location",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,

                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 210),
                    child: Text("Enter Phone number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'Please enter phone number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Phone number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,

                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 240),
                    child: Text("Enter your email",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'Please enter Email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,

                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 180),
                    child: Text("Enter your work experience",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: experience,
                      validator: (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'Enter your work experience';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your experience",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,

                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 180),
                    child: Text("Enter your work shop name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: shopname,
                      validator: (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'Enter your work shop name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your shop name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,

                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 210),
                    child: Text("Enter your password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'Please enter password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,

                  ),
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(onPressed: (){
                      if(_formkey.currentState!.validate()) {
                        mechanicsignup();
                      }


                    }, child: Text("SIGN UP",style: TextStyle(color: Colors.black),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                    ),
                  )

                ]
            ),
          ),
        )

    );
  }
}
