import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_mechanic/screens/Homepage.dart';
import 'package:the_mechanic/screens/setup.dart';
import 'package:the_mechanic/screens/splash_screen.dart';
import 'package:the_mechanic/screens/start_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //    apiKey: "AIzaSyBIefb8ZprgeyQUFiqF_85wJEfSOAUNxjE",
  // authDomain: "the-mechanic-47aec.firebaseapp.com",
  // projectId: "the-mechanic-47aec",
  // storageBucket: "the-mechanic-47aec.appspot.com",
  // messagingSenderId: "700419981635",
  // appId: "1:700419981635:web:6e3fd5110e22f1b0766ff6"
   // ),
  );
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'The Mechanic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const splash(),
    );
  }
}
