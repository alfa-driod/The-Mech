import 'dart:ui';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:squircle/squircle.dart';
import 'package:the_mechanic/form_field.dart';

class DriverSignUp extends StatelessWidget {
  const DriverSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Iconsax.arrow_circle_left5,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('media/img/driver_siginup_car.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Formfield(hint: 'Email'),
            Formfield(hint: 'Password'),
            Formfield(hint: 'Car Brand'),
            Formfield(hint: 'Car Model'),
            Formfield(hint: 'Engine Type'),
            Formfield(hint: 'Manual/Automatic'),
            Card(
              color: Colors.amberAccent,
              shape: SquircleBorder(superRadius: 200),
              child: SizedBox(
                height: 70,
                width: 280,
                child: Center(
                    child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 22),
                )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'Login with',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('media/custom-icons/google.png'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('media/custom-icons/FB.png'),
                ),
                CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      BootstrapIcons.apple,
                      size: 25,
                      color: Colors.black,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
