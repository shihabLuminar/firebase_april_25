import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddStudentScreenController with ChangeNotifier {
  String? studnetImageurl;
  Future<void> pickImage() async {
    studnetImageurl = null;
    notifyListeners();
    final ImagePicker picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final storageRef = FirebaseStorage.instance.ref();
      Reference? folderRef = storageRef.child("studentImages");
      final studentImgeRef = folderRef.child("studnet_$timestamp.jpeg");
      await studentImgeRef.putFile(File(pickedFile.path));
      studnetImageurl = await studentImgeRef.getDownloadURL();
      log(studnetImageurl!);
      //upload to firebase
      //get download url
    }
    notifyListeners();
  }
}
