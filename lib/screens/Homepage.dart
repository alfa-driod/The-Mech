import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:the_mechanic/AnnimatedIcon.dart';
import 'package:the_mechanic/Assistance/Assismethods.dart';
import 'package:the_mechanic/form_field.dart';
import 'package:the_mechanic/screens/driver_log_in.dart';
import 'package:the_mechanic/screens/liststyle.dart';
import 'package:the_mechanic/screens/user_profile.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_mechanic/Uploadimage.dart';

class Hompege extends StatefulWidget {
  const Hompege({Key? key}) : super(key: key);

  @override
  _HompegeState createState() => _HompegeState();
}

class _HompegeState extends State<Hompege> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  late Position currentPosition;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var geolacator = Geolocator();
  bool isMapCreated = false;
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  final uploadController = UploadControllerImpl();

  double bottompadding = 0;
  double toppadding = 0;

  locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    var address = await AssisMethods.searchCordinates(position);
    print("this is your address::" + address);
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  changeMapMode() {
    getJsonFile("media/dark.json").then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    newGoogleMapController.setMapStyle(mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    if (isMapCreated) {
      changeMapMode();
    }
    BorderRadiusGeometry radius = const BorderRadius.only(
        topLeft: Radius.circular(24), topRight: Radius.circular(24));
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.amber,
              size: 35,
            ),
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
                SizedBox(
                  height: 20,
                ),
                Stack(children: [
                  _imageFile == null
                      ? CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          child: Icon(
                            Icons.person,
                            size: 30,
                          ),
                          radius: 60,
                        )
                      : CircleAvatar(
                          radius: 60.0,
                          backgroundColor: Colors.blueGrey,
                          child: ClipOval(
                            child: Image.file(
                              File(_imageFile!.path),
                              fit: BoxFit.fitWidth,
                              width: 160.0,
                              height: 160.0,
                            ),
                          ),
                        ),
                  Positioned(
                      bottom: 10,
                      right: 13,
                      child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet()));
                          },
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 30,
                          )))
                ]),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Prince Obeng Nkoah',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfile()));
                    },
                    child: Text('Edit profile')),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Add Car',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(Icons.lock, color: Colors.grey),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(Icons.question_answer, color: Colors.blueGrey),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'FAQ',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(Icons.call, color: Colors.green),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Contact Us',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
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
                    Icon(Icons.logout, color: Colors.amberAccent),
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
      body: SlidingUpPanel(
        body: GoogleMap(
          padding: EdgeInsets.only(bottom: bottompadding, top: toppadding),
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          initialCameraPosition: _kGooglePlex,
          myLocationEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controllerGoogleMap.complete(controller);
            newGoogleMapController = controller;
            isMapCreated = true;
            locatePosition();
            changeMapMode();
            setState(() {
              bottompadding = 170;
              toppadding = 120;
            });
          },
        ),
        backdropEnabled: true,
        borderRadius: radius,
        panel: _slidingPage(),
        collapsed: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(249, 2, 29, 37), borderRadius: radius),
          child: Column(
            children: [
              AnimatedSlideUp(),
              //  Text("Slide Up For Autoshops",style: TextStyle(color: Colors.white,fontSize: 12),),
              //  Icon(Icons.keyboard_double_arrow_up,color: Colors.green,size: 60),
            ],
          ),
          //  Text("hey there",style: TextStyle(color: Colors.white),)
        ),
      ),
    );
  }

  signOut(context) async {
    await _firebaseAuth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
  }

  Widget _slidingPage() {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: ListView(
          children: [
            Formfield(),
            Mylistile(
              image: 'media/img/b.jpg',
              name: 'Bosch',
              location: 'kasoa',
              value: 3,
              state: 'opened',
              opened: true,
            ),
            Mylistile(
              image: 'media/img/fuel.jpg',
              name: 'Fuel-IT ENT',
              location: 'Mallam-Juntion',
              value: 4,
              state: 'opened',
              opened: true,
            ),
            Mylistile(
              image: 'media/img/hh.jpeg',
              name: 'Wrench-Bender',
              location: 'East-Legon',
              value: 5,
              state: 'closed',
              opened: false,
            ),
            Mylistile(
              image: 'media/img/sage.png',
              name: 'Sage Auto',
              location: 'East-Legon',
              value: 3,
              state: 'closed',
              opened: false,
            ),
            Mylistile(
              image: 'media/img/linear.jpg',
              name: 'Linear ENT',
              location: 'East-Legon',
              value: 4,
              state: 'closed',
              opened: false,
            ),
            Mylistile(
              image: 'media/img/rr.jpg',
              name: 'Repair Shop',
              location: 'East-Legon',
              value: 5,
              state: 'closed',
              opened: false,
            ),
          ],
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
        }
        else{
          displayToastMessage("Picture not added", context);

        }
      }
      else{
        displayToastMessage("Upload failed", context);

      }
    }
  }

  Widget bottomSheet() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose a profile picture",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera),
                  label: Text("camera")),
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text("Gallery")),
            ],
          )
        ],
      ),
    );
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: 5,
    );
  }
}
