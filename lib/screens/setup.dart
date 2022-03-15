import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:squircle/squircle.dart';
import 'package:the_mechanic/screens/driver_log_in.dart';
import 'package:the_mechanic/screens/driver_sign_up.dart';

class Setup extends StatefulWidget {
  const Setup({Key? key}) : super(key: key);

  @override
  _SetupState createState() => _SetupState();
}

class _SetupState extends State<Setup> {
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
        color: isActive?Colors.blue:Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(20))
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      
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
              padding: const EdgeInsets.only(right: 20,left: 20,),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      height: 500,
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
                               
                              ),
                            
                              // SizedBox(
                              //   height: 20,
                              // ),
                              Center(
                                child: Column(children: [Text(
                                      'Mechanics Around You',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                         ),
                                    ),
                                 
                             
                             
                                Text('Search for the best mechanics in your location',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),)],),
                              )
                               
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
                                
                              ),
                            
                             
                             
                              Center(
                                child: Column(children: [Text(
                                      'Schedule An Appointment',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                         ),
                                    ),
                                 
                             
                             
                                Text('Search for the best mechanics in your location',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),)],),
                              )
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
                             
                              ),
                            
                              
                             Center(
                                child: Column(children: [Text(
                                      'Tow Your Vehicle',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                         ),
                                    ),
                                 
                             
                             
                                Text('Search for the best mechanics in your location',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),)],),
                             
                              ),
                               
                            ],
                          ),
                        
                        ],
                      )),
                    
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                 SizedBox(
                    height:70,
                  ),
                 Container(
                    height: 50,
                    width: 300,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color.fromARGB(209, 255, 193, 7)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DriverSignUp(),
                        ));},
                        child: Text('Create An Account',
                            style: TextStyle(color: Colors.white,fontSize: 18))),
                  ),
                  
        
                ],
              ),
            ),
        ]),
    ),
    );
  }
}
