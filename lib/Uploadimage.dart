import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:the_mechanic/main.dart';

abstract class UploadController {
  Future<String?> uploadFile(File file, String folderName);
  Future<bool> addPost(String imgUrl);
  Future<String> getProfile();
}

class UploadControllerImpl implements UploadController {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseAuth mAuth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Future<String?> uploadFile(File file, String folderName) async {
    try {
      String filename = file.path.split('/').last;
      final Reference ref = storage.ref().child(folderName).child(filename);
      final UploadTask uploadtask = ref.putFile(file);
      final TaskSnapshot snapshot = await Future.value(uploadtask);
      final String downloadUri = await snapshot.ref.getDownloadURL();
      return downloadUri;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> addPost(String imgUrl) async {
    try {
      var UserDataMap = {"ImageUrl": imgUrl};

      usersRef.child(user!.uid).update(UserDataMap);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String> getProfile() async {
    DatabaseReference usersRef =
        FirebaseDatabase.instance.ref().child("users").child(user!.uid);

    final imgSnapshot = await usersRef.child("ImageUrl").get();
    print(imgSnapshot.value);
    return imgSnapshot.value as String;
    // usersRef.once().then((DataSnapshot snapshot)){

    // });
    // usersRef.onValue.listen((DatabaseEvent event) {
    //   final data = event.snapshot.value;

    // });
  }
}
