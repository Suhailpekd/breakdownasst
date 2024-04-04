import 'package:flutter/material.dart';
class Admin_Payment extends StatefulWidget {
  const Admin_Payment({super.key});

  @override
  State<Admin_Payment> createState() => _Admin_paymentState();
}

class _Admin_paymentState extends State<Admin_Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              Container(
                height: 900,
                width: 470,
                child: ListView.separated(
                    separatorBuilder: (context,index)=>Divider(
                      indent: 13,
                      endIndent: 60,
                      color:Colors.white ,
                      thickness: 20,
                      height: 50,
                    ),
                    itemCount: 10,
                    itemBuilder: (BuildContext context,int index){
                      return
                        Container(
                          height: 100,
                          width: 200,
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,


                            children: [
                              SizedBox(
                                width: 18,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [ Text("Name",style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(
                                        width: 200,
                                      ),
                                      Text("20/3/2024",style: TextStyle(fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  Text("5455/-",),
                                  Text("service"),
                                  Text("Mechanic Name"),
                                ],
                              )
                            ],

                          ),

                        );
                    }


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
