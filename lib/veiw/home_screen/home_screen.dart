import 'package:firebase_april_25/controller/home_screen_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeScreenController>().addStudent(3);
        },
      ),
      appBar: AppBar(
        title: const Text("Students"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: context.watch<HomeScreenController>().students.snapshots(),
        builder: (context, snapshot) {
          var studentDocuments = snapshot.data!.docs;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: studentDocuments.length,
              itemBuilder: (context, index) => StudentCard(
                onTap: () {
                  context.read<HomeScreenController>().onDelete(
                    studentDocuments[index].id,
                  );
                },
                student: {
                  "name": studentDocuments[index]["name"],
                  "ph": studentDocuments[index]["ph"],
                  "place": studentDocuments[index]["place"],
                },
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  const StudentCard({super.key, required this.student, required this.onTap});

  final Map<String, String> student;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Text(
            student["name"]![0], // first letter of name
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          student["name"]!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.phone, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(student["ph"]!),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(student["place"]!),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
