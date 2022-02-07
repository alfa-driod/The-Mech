import 'package:flutter/material.dart';
import 'package:squircle/squircle.dart';
import 'package:the_mechanic/screens/setup_page1.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('media/img/start_car.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 20),
                      child: Text(
                        'The Mechanic',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.amberAccent),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Text(
                        'connects you to the nearest \n autoshop that fixes your \n vehicle in the most \n convinient way',
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.62,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage1()));
                  },
                  child: Card(
                    shape: SquircleBorder(superRadius: 900),
                    color: Colors.amberAccent,
                    child: SizedBox(
                      height: 60,
                      width: 180,
                      child: Center(
                          child: Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
