import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_mechanic/screens/setup.dart';
import 'package:the_mechanic/screens/start_page.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => setup()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('media/img/Group 3.png',height: 500,),
          ),
       
          // CircularProgressIndicator(
          //   valueColor: AlwaysStoppedAnimation(Colors.amber),
          // )
        ],
      ),
    );
  }
}
