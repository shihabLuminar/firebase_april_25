import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreenController with ChangeNotifier {
  // collection reference
  var students = FirebaseFirestore.instance.collection('students');

  void onDelete(String id) {
    students.doc(id).delete();
  }

  void addStudent(int index) {
    students.add({
      "name": "data$index",
      "ph": "ph$index",
      "place": "place$index",
    });
  }

  void update() {
    students.doc('').update({"": ""});
  }
}
