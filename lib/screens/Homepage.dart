import 'package:flutter/material.dart';

class Hompege extends StatefulWidget {
  const Hompege({ Key? key }) : super(key: key);

  @override
  _HompegeState createState() => _HompegeState();
}

class _HompegeState extends State<Hompege> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('hey Welcome',style: TextStyle(fontSize: 30),)),
    );
  }
}