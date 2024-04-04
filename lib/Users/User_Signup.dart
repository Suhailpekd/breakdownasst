import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'User_Login.dart';

class User_Signup extends StatefulWidget {
  const User_Signup({super.key});

  @override
  State<User_Signup> createState() => _User_SignupState();
}

class _User_SignupState extends State<User_Signup> {
  final _formkey=GlobalKey<FormState>();
 var usename = TextEditingController();
 var location = TextEditingController();
 var number = TextEditingController();
 var email = TextEditingController();
 var password = TextEditingController();
 Future<dynamic> usersignup() async {
   await FirebaseFirestore.instance.collection('usersignup').add({
     "username": usename.text,
     "location": location.text,
     "phone": number.text,
     "email": email.text,
     "password": password.text,
     "path":"",
     "status":0
   }).then((value) {
     print("Success");
     Navigator.push(context, MaterialPageRoute(
         builder: (context) {
       return User_Login();
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
                    padding: const EdgeInsets.only(right: 240),
                    child: Text("Enter Username",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: usename,
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
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 240),
                    child: Text("Enter Location",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: location,
                      validator: (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'Please enter location';
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
                    height: 15,

                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 200),
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
                    height: 15,

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
                    height: 15,

                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 200),
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
                    height: 15,

                  ),
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(onPressed: (){
                      if(_formkey.currentState!.validate()) {
                        usersignup();

                      }


                    }, child: Text("SIGN UP",style: TextStyle(color: Colors.black),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                    ),
                    ),



                ]
            ),
          ),
        )

    );
  }
}
