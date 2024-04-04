import 'dart:developer';

import 'package:breakdown_assist/Mechanic/Mechanic_Service_Home.dart';
import 'package:breakdown_assist/Users/User_Home.dart';
import 'package:breakdown_assist/Users/User_Signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_Login extends StatefulWidget {
  const User_Login({Key? key}) : super(key: key);

  @override
  State<User_Login> createState() => _User_LoginState();
}

class _User_LoginState extends State<User_Login> {



  var Username = TextEditingController();
  var Password = TextEditingController();
  final formkey = GlobalKey<FormState>();


  String id = '';
  String username = '';
  String location = '';
  String phone = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/images/repair_image.png'),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "USER LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Text("Enter Username"),
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: Username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Text("Enter Password"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: Password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password',
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Implement your forgot password functionality here
              },
              child: Text("Forgot password?"),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                UserLogin();
                // Implement your login functionality here
              },
              child: Text("LOGIN"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                SizedBox(
                  width: 5,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return User_Signup();
                        },
                      ));
                    },
                    child: Text("Signup?")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void UserLogin() async {

    final user = await FirebaseFirestore.instance
        .collection('usersignup')
        .where('email', isEqualTo: Username.text)
        .where('password', isEqualTo: Password.text)
        .where('status', isEqualTo: 1)
        .get();
    if (user.docs.isNotEmpty) {

      id = user.docs[0].id;
      username = user.docs[0]['username'];
      email = user.docs[0]['email'];
      phone = user.docs[0]['phone'];
      location = user.docs[0]['location'];

      // path = user.docs[0]['Mechanicprofilepath'];
      SharedPreferences data = await SharedPreferences.getInstance();
      data.setString('id', id);
      // data.setString('path', path);
      data.setString('name', username);
      data.setString('email', email);
      data.setString('phone', phone);
      data.setString('location', location);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return User_home();
        },
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "username and password error",
        style: TextStyle(color: Colors.red),
      )));
    }
  }
}
