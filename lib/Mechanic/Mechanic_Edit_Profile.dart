
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mechanic_Profile.dart';

class Mech_Edit_profile extends StatefulWidget {
  const Mech_Edit_profile({super.key});

  @override
  State<Mech_Edit_profile> createState() => _Mech_Edit_profileState();
}

class _Mech_Edit_profileState extends State<Mech_Edit_profile> {

  var imageURL;
  XFile? _image;

  Future<void> pickimage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? pickedimage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedimage != null) {
        setState(() {
          _image = pickedimage;
        });
        print("Image upload succersfully");
        await uploadimage();
      }
    } catch (e) {
      print("Error picking image:$e");
    }
  }

  Future<void> uploadimage() async {
    try {
      if (_image != null) {
        Reference storrageReference =
        FirebaseStorage.instance.ref().child('profile/${_image!.path}');
        await storrageReference.putFile(File(_image!.path));
        imageURL = await storrageReference.getDownloadURL();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Uploaded succesfully",
              style: TextStyle(color: Colors.green),
            )));

        FirebaseFirestore.instance
            .collection("mechanicsignup")
            .doc(ID)
            .update({"path": imageURL});
        print("/////////picked$imageURL");
      } else
        CircularProgressIndicator();
    } catch (e) {
      print("Error uploading image:$e");
    }
  }

  final formkey = GlobalKey<FormState>();

  // final namectrl = TextEditingController();
  var usernamectrl = TextEditingController();
  var phonectrl = TextEditingController();
  var emailctrl = TextEditingController();
  var experiencectrl = TextEditingController();
  var shopnamectrl = TextEditingController();
  // final locationctrl = TextEditingController();

  var ID = '';

  void initState() {

    // TODO: implement initState
    getSavedData();
    super.initState();
  }

  void getSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    ID = prefs.getString('id')!;

    // location = prefs.getString('location')!;

    setState(() {});
  }

  updateprofile() async {
    FirebaseFirestore.instance.collection("mechanicsignup").doc(ID).update({
      "username": usernamectrl.text,
      "phone": phonectrl.text,
      "email": emailctrl.text,
      "experience": experiencectrl.text,
      "shopname": shopnamectrl.text,
      //   "location":locationctrl.text,
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Mechanic_Profile()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: ExactAssetImage("assets/images/person image.jpg"),
                ),
                SizedBox(
                  height: 30,
                ),
                IconButton(onPressed: (){
                  pickimage();
                },
                    icon: Icon(Icons.camera)),
                Padding(
                  padding: const EdgeInsets.only(right: 250),
                  child: Text(
                    "Enter username",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: usernamectrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // Validation Logic
                        return 'Please enter username';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: " username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 220),
                  child: Text(
                    "Enter phone number",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: phonectrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // Validation Logic
                        return 'Please enter phonenumber';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: " phone number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 280),
                  child: Text(
                    "Enter Email",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailctrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // Validation Logic
                        return 'Please enter email id';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 170),
                  child: Text(
                    "Enter your work experience",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: experiencectrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // Validation Logic
                        return 'Please enter experience';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: " work experience",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 170),
                  child: Text(
                    "Enter your work shop name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: shopnamectrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // Validation Logic
                        return 'Please enter shopname';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: " work shop name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 255),
                  child: Text(
                    "Enter location",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // controller: locationctrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // Validation Logic
                        return 'Please enter location';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "location",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        if (formkey.currentState!.validate()) {
                          updateprofile();
                        }
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
