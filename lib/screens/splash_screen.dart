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
          .pushReplacement(MaterialPageRoute(builder: (_) => StartPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              child: Image.asset('media/img/logo.png')),
          ),
          SizedBox(height: 20),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.black),
          )
        ],
      ),
    );
  }
}
