import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:the_mechanic/screens/Calender.dart';
import 'package:the_mechanic/screens/Eventedit.dart';

class Bookings extends StatelessWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Eventedit()));
        },
        label: Row(
          children: [Text("add Bookings"), Icon(Icons.add)],
        ),
        backgroundColor: Colors.amber,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: CalenderWidget(),
    );
  }
}
