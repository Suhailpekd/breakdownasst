import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mechanic_Home.dart';
import 'Mechanic_Signup.dart';

class Mechanic_Login extends StatefulWidget {
  const Mechanic_Login({Key? key}) : super(key: key);

  @override
  State<Mechanic_Login> createState() => _Mechanic_LoginState();
}

class _Mechanic_LoginState extends State<Mechanic_Login> {
  var Username = TextEditingController();
  var Password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String id = '';
  String username = '';
  String phone = '';
  String experience = '';
  String shopname = '';
  String email = '';
  String password = '';
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
              " MECH LOGIN",
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
                MechanicLogin();
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
                          return Mechanic_Signup();
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

  void MechanicLogin() async {
    final mech = await FirebaseFirestore.instance
        .collection('mechanicsignup')
        .where('email', isEqualTo: Username.text)
        .where('password', isEqualTo: Password.text)
        .where('status', isEqualTo: 1)
        .get();
    print("fetch data");
    if (mech.docs.isNotEmpty) {
      print("done???????????????????");
      id = mech.docs[0].id;
      username = mech.docs[0]['username'];
      email = mech.docs[0]['email'];
      phone = mech.docs[0]['password'];

      SharedPreferences data = await SharedPreferences.getInstance();
      data.setString('id', id);
      data.setString('name', username);
      data.setString('email', email);
      data.setString('phone', phone);
      // data.setString('experience', experience);
      // data.setString('shopname', shopname);
      // data.setString('password', password);
      print("Shared preffrence data added????????????????????????????????????");

      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Mechanic_Home();
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
