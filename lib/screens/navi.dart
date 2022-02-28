import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:the_mechanic/mech.dart';
import 'package:the_mechanic/screens/Homepage.dart';
import 'package:the_mechanic/screens/driver_log_in.dart';
import 'package:the_mechanic/screens/driver_sign_up.dart';
import 'package:the_mechanic/screens/home_page.dart';
import 'package:the_mechanic/screens/setup.dart';

class Navi extends StatefulWidget {
  const Navi({Key? key}) : super(key: key);

  @override
  _NaviState createState() => _NaviState();
}

class _NaviState extends State<Navi> {
  List pages = [
    Hompege(),
    Mechanic(),
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
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        onTap: onTap,
        currentIndex: curreentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade500,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
               label: 'Home' ,icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: 'Autoparts',
                icon: Icon(CupertinoIcons.wrench_fill)),
            BottomNavigationBarItem(
                label: 'Bookings', icon: Icon(CupertinoIcons.calendar)),
            BottomNavigationBarItem(
                label: 'Tow', icon: Icon(CupertinoIcons.creditcard_fill)),
          ]),
    );
  }
}
