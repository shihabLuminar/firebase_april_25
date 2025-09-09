import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreenController with ChangeNotifier {
  // collection reference
  var students = FirebaseFirestore.instance.collection('students');

  void onDelete(String id) {
    students.doc(id).delete();
  }

  void addStudent({
    required String name,
    required String ph,
    required String place,
  }) {
    students.add({"name": name, "ph": ph, "place": place});
  }

  void update() {
    students.doc('').update({"": ""});
  }
}
