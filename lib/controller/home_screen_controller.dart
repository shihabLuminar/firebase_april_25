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
    required String url,
  }) {
    students.add({"name": name, "ph": ph, "place": place, "url": url});
  }

  void update({
    required String id,
    required String name,
    required String ph,
    required String place,
  }) {
    final Map<String, dynamic> data = {};

    if (name.isNotEmpty) {
      data['name'] = name;
    }
    if (ph.isNotEmpty) {
      data['ph'] = ph;
    }
    if (place.isNotEmpty) {
      data['place'] = place;
    }

    if (data.isNotEmpty) {
      students.doc(id).update(data);
    }
  }
}
