import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:squircle/squircle.dart';
import 'package:the_mechanic/screens/driver_log_in.dart';
import 'package:the_mechanic/screens/driver_sign_up.dart';

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
        color: isActive?Colors.green:Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12))
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(
            Iconsax.arrow_circle_left5,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
        TextButton(onPressed: (){
           Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
        }, child: Text('Login',style:TextStyle(fontSize: 20) ,))
        ],
      ),
     
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child:  ListView(
        children: [
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
          //         Container(
          //           alignment: Alignment.centerLeft,
          //           child: IconButton(
          //   icon: Icon(
          //     Iconsax.arrow_circle_left5,
          //     size: 50,
          //   ),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          //         ),
                 
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
                                image: AssetImage('media/img/mechs.png'),
                                height: 300,
                                width: 300,
                              )),
                              Divider(
                                color: Colors.grey,
                                height: 30,
                              ),
                            
                              // SizedBox(
                              //   height: 20,
                              // ),
                             
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 20),
                                child: Center(
                                  child: Text(
                                    'Mechanics Around You',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                       ),
                                  ),
                                ),
                              ),
                              Text('Search for the best mechanics in your location',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Image(
                                image: AssetImage('media/img/nic.png'),
                                height: 300,
                                width: 300,
                              )),
                             
                               Divider(
                                color: Colors.grey,
                                height: 30,
                              ),
                            
                             
                             
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 20),
                                child: Center(
                                  child: Text(
                                    'Schedule Your Appointment',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                       ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text('Have an Appointment with your Mechanic to get\n                             your Vehicle fixed',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                            
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
                            
                             
                              Divider(
                                color: Colors.grey,
                                height: 30,
                              ),
                            
                              
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 20),
                                child: Center(
                                  child: Text(
                                    'Get Your Vehicle Towed',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                       ),
                                  ),
                                ),
                              ),
                              Text('A feature for you to get a towing car to tow your\n                              damaged vehicle',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                 SizedBox(
                    height:10,
                  ),
                 Container(
                    height: 50,
                    width: 300,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DriverSignUp(),
                        ));},
                        child: Text('Create An Account',
                            style: TextStyle(color: Colors.white,fontSize: 15))),
                  ),
                  
        
                ],
              ),
            ),
        ]),
    ),
    );
  }
}
