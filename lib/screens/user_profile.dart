import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:squircle/squircle.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.arrow_left_circle_fill,
            )),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings))
        ],
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
            Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(''),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Sir Prince',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('media/img/q7.png'),
                  ),
                  // color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Car Specs',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  shape: SquircleBorder(
                      superRadius: 300,
                      side: BorderSide(color: Colors.white, width: 2)),
                  color: Colors.black,
                  child: SizedBox(
                    height: 130,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Brand',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Audi',
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: SquircleBorder(
                      superRadius: 300,
                      side: BorderSide(color: Colors.white, width: 2)),
                  color: Colors.black,
                  child: SizedBox(
                    height: 130,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Engine',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'V12',
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  shape: SquircleBorder(
                      superRadius: 300,
                      side: BorderSide(color: Colors.white, width: 2)),
                  color: Colors.black,
                  child: SizedBox(
                    height: 130,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Max Pow.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '720 hp',
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: SquircleBorder(
                      superRadius: 300,
                      side: BorderSide(color: Colors.white, width: 2)),
                  color: Colors.black,
                  child: SizedBox(
                    height: 130,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Make',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Q 7',
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.085,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Manage Subscription',
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
