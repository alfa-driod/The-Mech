import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
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
          SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
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
          ),
          SizedBox(height: 20),
          Row(children: [
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
                   shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12),),
                  child: Container(
                    height: 120,
                    width: 300,
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
                  top: -100,
                  right: -20,
                  child: Image.asset(
                    "media/img/nn.png",
                    width: 200,
                    height: 310,
                  ))
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
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
                bigContainer("media/img/oil.png","Oil Filtering","Enhance Car's Smoothness ","1010"),
                bigContainer("media/img/bbb.png","Headlight Fix","Improves Car Visibilty By 50%","900"),
                bigContainer("media/img/ccc.png","Car Detailing","Enhance Car's Valu","1010"),
                bigContainer("media/img/ddd.png","Battery Change","Enhance Car's Value By 30%","1010"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget service(
      {required String img,
      required String text,
      required String atext,
      required String state}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(255, 4, 69, 122),
                  width: 1,
                  style: BorderStyle.solid),
              color: Color.fromARGB(249, 2, 29, 37),
              borderRadius: BorderRadius.circular(15.0),
             
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  img,
                  height: 70,
                  width: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                  child: Text(text),
                ),
                Center(
                    child: Text(
                  atext,
                  style: TextStyle(),
                ))
              ],
            ),
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
      ),
    );
  }

  Widget bigContainer(String img,String type,String btext,String ctext) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15),),
        child: Container(
        height: 320,
        width: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(249, 2, 29, 37),
           boxShadow: [
                  BoxShadow(
                     color: Color.fromARGB(249, 2, 29, 37),
                    blurRadius: 2.0,
                    spreadRadius: 2.0
                  )
                ]
        
        ),
        child: Stack(
          children: [
            Positioned(
              top:-30,
              right: 20,
              child: Image.asset(img,width: 200,height: 200,)),
               Positioned(
              top: 170,
              left: 90,
              child:Text("Trending",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)),
               Positioned(
              top: 150,
              left: 110,
              child:Icon(Icons.trending_up)),
               Positioned(
              child:Divider(thickness: 20,color: Color.fromARGB(216, 255, 214, 64),),),
             
               Positioned(
              top: 200,
              left: 50,
              child:Text(type,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
               Positioned(
              top: 250,
              left: 35,
              child:Text(btext,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),)),
              Divider(thickness: 5,color: Colors.white,),
               Positioned(
              bottom: 0,
              left: 15,
              
              child:RichText(text: TextSpan(
                text: ctext,
                style: TextStyle(color: Color.fromARGB(255, 22, 247, 29)),
                children: [
                  TextSpan(
                    text: 'People Booked in your area',
                     style: TextStyle(color: Colors.white),
                  )
                 ]

              ))),
             
              

          ],
        ),
        
        ),
      ),
    );
  }
}
