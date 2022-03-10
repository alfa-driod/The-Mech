import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:the_mechanic/main.dart';

abstract class UploadController {
  Future<String?> uploadFile(File file, String folderName);
  Future<bool> addPost(String imgUrl);
}

class UploadControllerImpl implements UploadController {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseAuth mAuth = FirebaseAuth.instance;

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
      await usersRef.update({
        "img_url": imgUrl,
        "user_id": mAuth.currentUser!.uid
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
