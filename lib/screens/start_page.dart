import 'package:flutter/material.dart';
import 'package:squircle/squircle.dart';
import 'package:the_mechanic/screens/setup.dart';
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
                image: AssetImage('media/img/g.jpg'),
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                fit: BoxFit.cover)),
                
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 30),
                      child: Text(
                        'The Mechanic',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
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
                        style: TextStyle(color: Colors.white, fontSize: 25),
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
                        MaterialPageRoute(builder: (context) => setup()));
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
