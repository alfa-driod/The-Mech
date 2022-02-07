import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:squircle/squircle.dart';
import 'package:the_mechanic/screens/company_sign_up.dart';
import 'package:the_mechanic/screens/driver_sign_up.dart';

class LoginPage1 extends StatelessWidget {
  const LoginPage1({Key? key}) : super(key: key);

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
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('media/img/login_car.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CompanyRegister()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                  color: Colors.amberAccent,
                  child: SizedBox(
                    height: 45,
                    width: 300,
                    child: Center(
                        child: Text(
                      'Sign Up as Company',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DriverSignUp(),
                      ));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                  color: Colors.amberAccent,
                  child: SizedBox(
                    height: 45,
                    width: 300,
                    child: Center(
                        child: Text(
                      'Sign Up as Driver',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            Text(
              'Log In',
              style: TextStyle(fontSize: 22, color: Colors.amberAccent),
            )
          ],
        ),
      ),
    );
  }
}
