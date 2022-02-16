import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class setup extends StatefulWidget {
  const setup({Key? key}) : super(key: key);

  @override
  _setupState createState() => _setupState();
}

class _setupState extends State<setup> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: isActive ? 24:16,
      decoration:BoxDecoration(
        color: isActive?Colors.white:Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(12))
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey,
              Colors.black,
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text('Skip',
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                ),
                Container(
                    height: 600,
                    width: double.infinity,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Image(
                              image: AssetImage('media/img/tow.png'),
                              height: 300,
                              width: 300,
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'CONNECT with',
                                style: TextStyle(
                                    color: Colors.yellow[200],
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 20),
                              child: Text(
                                'Mechanics Around You',
                                style: TextStyle(
                                    color: Colors.yellow[200],
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Divider(
                              color: Colors.blue[100],
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 20),
                              child: Text(
                                'paaansbapshkaka\nisoappsmmklkskkkkkwhshkapa\nisjaksonnnnjsuwqosjnn',
                                style: TextStyle(
                                    color: Colors.lightGreen, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Image(
                              image: AssetImage('media/img/tow.png'),
                              height: 300,
                              width: 300,
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'CONNECT with',
                                style: TextStyle(
                                    color: Colors.yellow[200],
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 20),
                              child: Text(
                                'Mechanics Around You',
                                style: TextStyle(
                                    color: Colors.yellow[200],
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Divider(
                              color: Colors.blue[100],
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 20),
                              child: Text(
                                'paaansbapshkaka\nisoappsmmklkskkkkkwhshkapa\nisjaksonnnnjsuwqosjnn',
                                style: TextStyle(
                                    color: Colors.lightGreen, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Image(
                              image: AssetImage('media/img/fix.png'),
                              height: 300,
                              width: 300,
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'CONNECT with',
                                style: TextStyle(
                                    color: Colors.yellow[200],
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 20),
                              child: Text(
                                'Mechanics Around You',
                                style: TextStyle(
                                    color: Colors.yellow[200],
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Divider(
                              color: Colors.blue[100],
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 20),
                              child: Text(
                                'paaansbapshkaka\nisoappsmmklkskkkkkwhshkapa\nisjaksonnnnjsuwqosjnn',
                                style: TextStyle(
                                    color: Colors.lightGreen, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                )
              ],
            ),
          )),
    ));
  }
}
