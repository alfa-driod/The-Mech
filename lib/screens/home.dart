
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:the_mechanic/Uploadimage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_mechanic/screens/Homepage.dart';
import 'package:the_mechanic/screens/driver_log_in.dart';

import 'package:the_mechanic/screens/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_mechanic/screens/user_profile.dart';
import 'package:image_picker/image_picker.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PickedFile? _imageFile;
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final ImagePicker _picker = ImagePicker();
  final uploadController = UploadControllerImpl();

  double bottompadding = 0;
  double toppadding = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            extendBodyBehindAppBar: true,

      appBar: AppBar(

        backgroundColor:Colors.black,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
         actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications,color: Colors.blueGrey,)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings,color:Colors.grey))
        ],
      ),
      backgroundColor: Colors.black,
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack(children: [
                  FutureBuilder<String>(
                      future: uploadController.getProfile(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData || snapshot.data != null) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            // child:
                            child: Image.network(
                              snapshot.data!, 
                              fit: BoxFit.cover,
                              width: 120,
                              height: 120,
                            ),
                          );
                        }

                        return const CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          radius: 60,
                        );
                      }),
                  Positioned(
                      bottom: 10,
                      right: 13,
                      child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet()));
                          },
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 30,
                          )))
                ]),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder<String>(
                    future: uploadController.getName(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData || snapshot.data != null) {
                        return Text(
                          snapshot.data!,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        );
                      }
                      return Text("Add name");
                    }),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserProfile()));
                    },
                    child: const Text('Edit profile')),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(Icons.add, color: Colors.white),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Add Car',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(Icons.lock, color: Colors.grey),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Privacy Policy',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(Icons.question_answer, color: Colors.blueGrey),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'FAQ',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(Icons.call, color: Colors.green),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Contact Us',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180.0, left: 10),
              child: InkWell(
                onTap: () {
                  signOut(context);
                },
                child: Row(
                  children: [
                    const Icon(Icons.logout, color: Colors.amberAccent),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Logout',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        
        children:[
        
          ListView(
          children: <Widget>[
            SizedBox(height: 15.0),
            CarouselSlider(
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('media/img/xx.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('media/img/aa.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('media/img/ff.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                " Services",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
            ),
          
            Row(
             
             mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                service(
                    img: "media/iconspng/c.png",
                    text: " Book for a",
                    atext: "Mechanic",
                    state: ""),
                service(
                    img: "media/iconspng/map.png",
                    text: "Mechanic at",
                    atext: "Location",
                    state: ""),
                service(
                    img: "media/iconspng/autopp.png",
                    text: "Buy New",
                    atext: "Autoparts",
                    state: ""),
              ],
            ),
            SizedBox(height: 20),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
              service(
                  img: "media/iconspng/check-list.png",
                  text: "Get Your Car",
                  atext: "Diagnosed",
                  state: ""),
              service(
                  img: "media/iconspng/pay.png",
                  text: "Fast and Easy",
                  atext: "Payment",
                  state: "New"),
              service(
                  img: "media/iconspng/deli.png",
                  text: "Autoparts",
                  atext: "Deliveries",
                  state: "New"),
            ]),
            SizedBox(
              height: 40,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      height: 140,
                      width: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "Get A Discount !!   ",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 20,
                              width: 130,
                              child: Text(" On First 2 Autoparts  ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 96, 33, 243),
                                      fontWeight: FontWeight.bold)),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 96, 33, 243),
                                Color.fromARGB(197, 255, 235, 59),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                    ),
                  ),
                ),
                Positioned(
                    top: -80,
                    right: -15,
                    child: Image.asset(
                      "media/img/nn.png",
                      width: 200,
                      height: 310,
                    ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 6.0,
              ),
              child: Text(
                " Trending Services",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  bigContainer("media/img/oil.png", "Oil Filtering",
                      "Enhance Car's Smoothness ", "1010 "),
                  bigContainer("media/img/bbb.png", "Headlight Fix",
                      "Improves Car Visibilty By 50%", "900 "),
                  bigContainer("media/img/ccc.png", "Car Detailing",
                      "Details Problems On Your Car", "1200 "),
                  bigContainer("media/img/ddd.png", "Battery Charge",
                      "Increases Your Battery Health ", "1300 "),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Most Wanted Autoparts",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Users most orded spareparts this Year!!!",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  autoparts(
                      img: "media/img/cccc.jpg",
                      atext: "Tyres",
                      btext: "Added in 150 carts",
                      state: "New"
                      ),
                  autoparts(
                      img: "media/img/aaaa.jpg",
                      atext: "Breaks ",
                      btext: "Added in 200 carts",
                      state: "New"
                      ),
                  autoparts(
                      img: "media/img/iiii.jpg",
                      atext: "oil",
                      btext: "Added in 300 carts",
                      state: "Old"
                      ),
                  autoparts(
                      img: "media/img/dddd.jpg",
                      atext: "Engine",
                      btext: "Added in 170 carts",
                      state: "Old"
                      ),
                ],
              ),
            ),
            
            Image.asset("media/img/ni.png"),
          SizedBox(height: 5,),
          Center(
            child: RichText(text: TextSpan(
              text: "Refer To Friends & Family And Get ",
              style: TextStyle(fontSize: 14),
              children: [
                TextSpan(text: "10% ",
                style: TextStyle(color: Colors.amber,fontSize: 20)
                ),
                TextSpan(text: "Off On Every Trasactions "),
      
              ]
      
            ),
        
            ),
          )
          ],
        ),
          Positioned(
            bottom: 0,
            child:Container( padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: 70,
                
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                  color: Color.fromARGB(220, 221, 250, 240),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    Text(
                      'Connect With A Mechanic Now',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      ),
                      onPressed: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Hompege()));
                    }, child: Text("Connect",style: TextStyle(color: Colors.white),),)
                  ],
                ),
              ),) ,
        ], 
      ),
    );
  }



  Widget autoparts(
      {required String img, required String atext, required String btext,required String state}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 14),
      child: Container(
        height: 130,
        width: 270,
        decoration: BoxDecoration(
          color: Color.fromARGB(48, 158, 158, 158),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(img),
                           
                            fit: BoxFit.fitWidth))),
                Positioned(
                    top: 20,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        atext,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )),
                   Positioned(
              top: 0,
              right: -5,
              child: Container(
                height: 15,
                width: 27,
              
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 15, 235, 23),
                ),
                child: Center(
                  child: Text(
                    state,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ))
              ],
            ),
            SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.add_alert,
                  color: Colors.amber,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 5),
                  child: Text(btext),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget service(
      {required String img,
      required String text,
      required String atext,
      required String state}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              img,
              height: 70,
              width: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
              child: Text(text),
            ),
            Center(
                child: Text(
              atext,
              style: TextStyle(),
            ))
          ],
        ),
        Positioned(
            top: -5,
            right: -8,
            child: Text(
              state,
              style: TextStyle(
                  color: Color.fromARGB(255, 6, 235, 13),
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ))
      ],
    );
  }

  Widget bigContainer(String img, String type, String btext, String ctext) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          height: 350,
          width: 230,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(249, 2, 29, 37),
            
              ),
          child: Stack(
            children: [
              Positioned(
                  top: -20,
                  right: 20,
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 200,
                  )),
              Positioned(
                  top: 190,
                  left: 90,
                  child: Text(
                    "Trending",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  )),
              Positioned(top: 160, left: 110, child: Icon(Icons.trending_up)),
              Positioned(
                child: Divider(
                  thickness: 20,
                  color: Color.fromARGB(216, 255, 214, 64),
                ),
              ),
              Positioned(
                  top: 220,
                  left: 50,
                  child: Text(
                    type,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
              Positioned(
                  top: 270,
                  left: 35,
                  child: Text(
                    btext,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  )),
              Divider(
                thickness: 5,
                color: Colors.white,
              ),
              Positioned(
                bottom: 5,
                left: 10,
                child: RichText(
                    text: TextSpan(
                        text: ctext,
                        style: TextStyle(
                            color: Color.fromARGB(255, 248, 195, 4)),
                        children: [
                      TextSpan(
                        text: 'People Booked in your area',
                        style: TextStyle(color: Colors.white),
                      )
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  
  }
   void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final downloadUrl =
          await uploadController.uploadFile(File(pickedFile.path), "Pictures");
      if (downloadUrl != null) {
        final isAdded = await uploadController.addPost(downloadUrl);
        if (isAdded) {
          displayToastMessage("Picture has been added successfully", context);
        } else {
          displayToastMessage("Picture not added", context);
        }
      } else {
        displayToastMessage("Upload failed", context);
      }
    }
  }

  Widget bottomSheet() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          const Text(
            "Choose a profile picture",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text("camera")),
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.image),
                  label: const Text("Gallery")),
            ],
          )
        ],
      ),
    );
  }
  signOut(context) async {
    await _firebaseAuth.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const login()));
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: 5,
    );
  }
}
