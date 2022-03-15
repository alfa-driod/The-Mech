import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:the_mechanic/screens/bookings.dart';
import 'package:the_mechanic/screens/chat_page.dart';
import 'package:the_mechanic/services.dart';

class AutoshopProfile extends StatefulWidget {
  const AutoshopProfile({Key? key}) : super(key: key);

  @override
  State<AutoshopProfile> createState() => _AutoshopProfileState();
}

class _AutoshopProfileState extends State<AutoshopProfile> {
  bool isAppBarBg = false;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          isAppBarBg = true;
        });
      } else {
        setState(() {
          isAppBarBg = false;
        });
      }
    });
    print('isAppBarBg: $isAppBarBg');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // title: Text(isAppBarBg ? 'AUTOSHOPZ' : ''),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.arrow_left_circle_fill,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.grey, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              children: [
                const SizedBox(
                  height: kToolbarHeight + 25,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('media/img/b.jpg'),
                      radius: 50,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Bosh',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Column(
                  children: List.generate(
                      mech.length,
                      (index) => Column(
                            children: [
                              Services(
                                serves: mech[index],
                                position: index,
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          )),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatPage()));
                  },
                  child: const Text(
                    'Contact Us',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bookings()));
                  },
                  child: const Text(
                    'Book An Appointment',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                )
              ]),
        ));
  }
}
