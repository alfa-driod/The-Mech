import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:the_mechanic/screens/Homepage.dart';
import 'package:the_mechanic/screens/driver_log_in.dart';
import 'package:the_mechanic/screens/driver_sign_up.dart';
import 'package:the_mechanic/screens/setup.dart';

class Navi extends StatefulWidget {
  const Navi({Key? key}) : super(key: key);

  @override
  _NaviState createState() => _NaviState();
}

class _NaviState extends State<Navi> {
  List pages = [
    Hompege(),
    DriverSignUp(),
    setup(),
    login(),
  ];
  int curreentIndex = 0;
  void onTap(int index) {
    setState(() {
      curreentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[curreentIndex],
      bottomNavigationBar: BottomNavigationBar(
        
        onTap: onTap,
        currentIndex: curreentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                title: Text('Home'), icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                title: Text('Autoparts'),
                icon: Icon(CupertinoIcons.wrench_fill)),
            BottomNavigationBarItem(
                title: Text('Bookings'), icon: Icon(CupertinoIcons.calendar)),
            BottomNavigationBarItem(
                title: Text('Tow'), icon: Icon(CupertinoIcons.creditcard_fill)),
          ]),
    );
  }
}
