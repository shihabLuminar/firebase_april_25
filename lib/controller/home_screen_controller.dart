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

  void update({required String id, String? name, String? ph, String? place}) {
    final Map<String, dynamic> data = {};

    if (name != null) {
      data['name'] = name;
    }
    if (ph != null) {
      data['ph'] = ph;
    }
    if (place != null) {
      data['place'] = place;
    }

    if (data.isNotEmpty) {
      students.doc(id).update(data);
    }
  }
}
