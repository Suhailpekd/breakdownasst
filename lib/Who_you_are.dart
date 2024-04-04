import 'package:breakdown_assist/Admin/Admin_Login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Who You Are',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WhoYouAreScreen(),
    );
  }
}

class WhoYouAreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Who You Are'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                width: 250,
                child: Image.asset('assets/images/repair_image.png')),
            SizedBox(
              height: 20,
            ),
            Text(
              'Who you are',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  // Handle first button press
                  // print('First button pressed!');
                },
                child: Text('Mechanic'),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 40,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  onPressed:
                  () {};

                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyApp()));

                  // Handle second button press
                  // print('Second button pressed!');
                },
                child: Text('User'),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LOGIN()),
                  );
                },
                child: Text("Admin Login"))
          ],
        ),
      ),
    );
  }
}
