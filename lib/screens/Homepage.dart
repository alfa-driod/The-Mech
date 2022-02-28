import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_mechanic/screens/autoshop_profile.dart';
import 'package:the_mechanic/screens/user_profile.dart';
import 'package:the_mechanic/services.dart';
import 'package:flutter/services.dart';
class Hompege extends StatefulWidget {
  const Hompege({Key? key}) : super(key: key);

  @override
  _HompegeState createState() => _HompegeState();
}

class _HompegeState extends State<Hompege> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       extendBodyBehindAppBar: true,
      appBar: AppBar(
         elevation: 0,
        backgroundColor: Colors.transparent,
         leading: Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.menu,color: Colors.black,size: 35,),
                onPressed: () {
                Scaffold.of(context).openDrawer();
                },
            ),
            ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            Column(
             
              children: [
                 SizedBox(height: 20,),
                CircleAvatar(
                  backgroundColor:Colors.white,
                  radius: 50,
                  child: Icon(Icons.person,size: 50,),
                ),
                SizedBox(height: 10,),
              Text('Prince Obeng Nkoah',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
              TextButton(onPressed: (){}, child:Text('Edit profile')),
              
              ],
            ),
            Divider(color: Colors.grey,),
           Padding(
             padding: const EdgeInsets.only(top:8.0,left:8),
             child: InkWell(
               onTap: () {
                 
               },
               child: Row(
                 children: [
                   Icon(Icons.add,color: Colors.white),
                   Padding(
                     padding: const EdgeInsets.only(left:20.0),
                     child: Text('Add Car',style: TextStyle(fontSize: 20,color: Colors.white),),
                   )
                 ],
               ),
             ),
           ),
            Divider(color: Colors.grey,),
           Padding(
             padding: const EdgeInsets.only(top:8.0,left:8),
             child: InkWell(
               onTap: () {
                 
               },
               child: Row(
                 children: [
                   Icon(Icons.lock,color: Colors.grey),
                   Padding(
                     padding: const EdgeInsets.only(left:20.0),
                     child: Text('Privacy Policy',style: TextStyle(fontSize: 20,color: Colors.white),),
                   )
                 ],
               ),
             ),
           ),
            Divider(color: Colors.grey,),
           Padding(
             padding: const EdgeInsets.only(top:8.0,left:8),
             child: InkWell(
               onTap: () {
                 
               },
               child: Row(
                 children: [
                   Icon(Icons.question_answer,color: Colors.blueGrey),
                   Padding(
                     padding: const EdgeInsets.only(left:20.0),
                     child: Text('FAQ',style: TextStyle(fontSize: 20,color: Colors.white),),
                   )
                 ],
               ),
             ),
           ),
            Divider(color: Colors.grey,),
           Padding(
             padding: const EdgeInsets.only(top:8.0,left:8),
             child: InkWell(
               onTap: () {
                 
               },
               child: Row(
                 children: [
                   Icon(Icons.call,color: Colors.grey),
                   Padding(
                     padding: const EdgeInsets.only(left:20.0),
                     child: Text('Contact Us',style: TextStyle(fontSize: 20,color: Colors.white),),
                   )
                 ],
               ),
             ),
           ),
            Divider(color: Colors.grey,),
           Padding(
             padding: const EdgeInsets.only(top:200.0,left:170),
             child: InkWell(
               onTap: () {
                 
               },
               child: Row(
                 children: [
                   Icon(Icons.logout,color: Colors.blueGrey),
                   Padding(
                     padding: const EdgeInsets.only(left:20.0),
                     child: Text('Logout',style: TextStyle(fontSize: 20,color: Colors.white),),
                   )
                 ],
               ),
             ),
           ),
            
           
          ],
        ),
      ),
      body: Stack(
        children: [
      
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;
            },
          ),
          Positioned(
            left: 0.0,
            right:0.0 ,
            bottom: 0.0,
            child:Container(
              height: 245,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                boxShadow: [
                 BoxShadow(
                   color: Colors.black,
                   blurRadius: 16.0,
                   spreadRadius: 0.5,

                 ) 
                ]
              ),
              child: Column(
                children: [
                  SizedBox(height: 6,),
                  Text('Available Autoshops',style: TextStyle(color: Colors.white,fontSize: 20),),
                  
                  Padding(
                    padding: const EdgeInsets.only(top:20.0,left: 20.0,right: 8),
                    child: Row(
                      children: [
                        InkWell(
                          onTap:(){
                              Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>AutoshopProfile()));
                          } ,
                          child: Container(
                            height: 150,
                            width:  150,
                            
                            decoration: BoxDecoration(
                              image:DecorationImage(image: 
                              AssetImage('media/img/es.png'),
                               fit: BoxFit.cover
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                              
                            ),
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 150,
                            width: 150,
                            
                            decoration: BoxDecoration(
                               image:DecorationImage(image: 
                            AssetImage('media/img/n.png'),
                             fit: BoxFit.cover
                            ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),

          )),
            Positioned( 
          top: 70,
          right: 15,
          left: 15,
          
          child:TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
               fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search For Autoshop',
                       border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.black)),
            ),
          ) ),
        ],
      ),
    );
  }
}
