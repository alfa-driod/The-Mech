import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
        backgroundColor: Colors.white,
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
                color: Colors.blueGrey,
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
                        MaterialPageRoute(builder: (context) =>UserProfile()));
                          } ,
                          child: Container(
                            height: 150,
                            width:  MediaQuery.of(context).size.width,
                            
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
