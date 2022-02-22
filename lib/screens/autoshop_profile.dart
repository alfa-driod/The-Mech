import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:the_mechanic/services.dart';
import 'package:squircle/squircle.dart';

class AutoshopProfile extends StatefulWidget {
  const AutoshopProfile({Key? key}) : super(key: key);

  @override
  State<AutoshopProfile> createState() => _AutoshopProfileState();
}

class _AutoshopProfileState extends State<AutoshopProfile> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.arrow_left_circle_fill,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.grey, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.093,
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200),
                            side: BorderSide(width: 2, color: Colors.white)),
                        child: SizedBox(
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'AUTOSHOPZ',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('media/img/q7.png'),
                      ),
                      // color: Colors.red,
                    ),
                  ),
                ),
                Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: mech.length,
                    itemBuilder: (context, index) {
                      return Services(
                        serves: mech[index],
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'Contact Us',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    )),
                  ),
                )
              ]),
        ));
  }
}
