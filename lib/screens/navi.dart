import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:the_mechanic/mech.dart';
import 'package:the_mechanic/screens/Appointments.dart';
import 'package:the_mechanic/screens/Homepage.dart';
import 'package:the_mechanic/screens/bookings.dart';
import 'package:the_mechanic/screens/driver_log_in.dart';
import 'package:the_mechanic/screens/driver_sign_up.dart';
import 'package:the_mechanic/screens/home.dart';
import 'package:the_mechanic/screens/home_page.dart';
import 'package:the_mechanic/screens/payment_page.dart';
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
    Home(),
    PaymentPage(),
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
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.grey.shade500,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
               label: 'Home' ,icon: Icon(Icons.home_outlined,size: 40,)),
            BottomNavigationBarItem(
                label: 'Autoparts',
                icon: Icon(Icons.handyman,size: 30)),
            BottomNavigationBarItem(
                label: 'Appointments', icon: Icon(Icons.calendar_month_sharp,size: 30)),
            BottomNavigationBarItem(
                label: 'Payment', icon: Icon(CupertinoIcons.creditcard_fill,size: 30)),
          ]),
    );
  }
}
