import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:the_mechanic/screens/event.dart';
import 'package:firebase_database/firebase_database.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;

  EventViewingPage({Key? key, required this.event}) : super(key: key);

  final FirebaseDatabase database = FirebaseDatabase.instance;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FirebaseAnimatedList(
            shrinkWrap: true,
            query: FirebaseDatabase.instance
                .ref()
                .child("users")
                .child(user!.uid)
                .child("Appointments"),
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              // return new FutureBuilder<String>(
              //   builder: (BuildContext context, snapshot){
              //     return new ListTile(

              //       subtitle: Text(snapshot.data.toString()),
              //     );
              //   },
              // );
              Object? key = snapshot.value;

              return ListTile(
                title: Text('key'),
              );
            }),
      ),
    );
  }
}
