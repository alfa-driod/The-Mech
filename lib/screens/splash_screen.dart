import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_mechanic/screens/home_page.dart';
import 'package:the_mechanic/screens/navi.dart';
import 'package:the_mechanic/screens/setup.dart';
import 'package:the_mechanic/screens/start_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final firebaseAuth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      firebaseAuth.authStateChanges().listen((event) {
        if (event?.uid == null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Setup()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Navi()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('media/img/bma.jpg'),
                colorFilter: ColorFilter.mode(
                    Color.fromARGB(134, 0, 0, 0), BlendMode.darken),
                fit: BoxFit.cover)),
        child: Center(
          child: Image.asset(
            'media/img/New White.png',
            width: 180,
          ),
        ),
      ),
    );
  }
}
