import 'package:flutter/material.dart';

class User_Payment extends StatefulWidget {
  const User_Payment({super.key});

  @override
  State<User_Payment> createState() => _User_PaymentState();
}

class _User_PaymentState extends State<User_Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(""),
            ),
            Text("Successfull",style: TextStyle(fontSize: 25),),
            Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white
                ),
                onPressed: (){},
                child: Text("Back to home page")),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ) ,
    );
  }
}