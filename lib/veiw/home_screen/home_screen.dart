import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> students = const [
    {"name": "Aarav Sharma", "phone": "9876543210", "place": "Delhi"},
    {"name": "Priya Verma", "phone": "9123456789", "place": "Mumbai"},
    {"name": "Rahul Singh", "phone": "9988776655", "place": "Bangalore"},
    {"name": "Sneha Patel", "phone": "9090909090", "place": "Ahmedabad"},
    {"name": "Aditya Mehta", "phone": "9871234567", "place": "Kolkata"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
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
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(student["phone"]!),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 6),
                      Text(student["place"]!),
                    ],
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // navigate to details page if needed
              },
            ),
          );
        },
      ),
    );
  }
}
