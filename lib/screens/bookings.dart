import 'package:flutter/material.dart';

class Bookings extends StatelessWidget {
  const Bookings({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Text('Your Appointments',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),),
    );
  }
}