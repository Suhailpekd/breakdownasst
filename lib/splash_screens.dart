import 'package:breakdown_assist/Who_you_are.dart';
import 'package:flutter/material.dart';

import 'Admin/Admin_Login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tohome();
  }

  Tohome()async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WhoYouAreScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Image.asset("assets/images/repair_image.png"),
      )
    );
  }
}
