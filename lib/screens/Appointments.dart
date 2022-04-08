import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  const Appointments({ Key? key }) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      ListView(children: [
          Padding(
        padding: const EdgeInsets.only(top: 180.0,left: 20),
        child: Column(
          children: [
            Center(child: Text("Opps! No Appointment booked with a",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),)),
            SizedBox(height: 10,),
            Center(child: Text("Mechanic",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),)),
            SizedBox(height: 30,),
            Container(child: Image.asset('media/img/pg3.png',width: 300,)),
            Divider(thickness: 2,)
          ],
        ),
      ),
      ],)
    
    );
  }
}