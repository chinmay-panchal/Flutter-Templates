import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Showdatascreen extends StatelessWidget {
  const Showdatascreen({super.key});

  Stream<QuerySnapshot> getUsersStream() {
    return FirebaseFirestore.instance
        .collection('UserDataCollection') // Same collection name as in the form
        .snapshots();
  }

  Future<void> deleteImage(String imageUrl) async {
    try {
      final storageRef = FirebaseStorage.instance.refFromURL(imageUrl);
      await storageRef.delete();
      print("image deleted from storage");
    } catch (e) {
      print("Error deleting image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Data')),
      body: StreamBuilder<QuerySnapshot>(
        stream: getUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No data found'));
          }

          final users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index].data() as Map<String, dynamic>;

              return Container(
                height: 150,
                // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(user['ImageURL']))),
                child: Column(
                  children: [
                    CircleAvatar(
                        backgroundImage: user['ImageURL'] == null
                            ? null
                            : NetworkImage(user['ImageURL'])),
                    ListTile(
                      title: Text('Name: ${user['Name']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email: ${user['Email']}'),
                          Text('Password: ${user['Password']}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          try {
                            FirebaseFirestore.instance
                                .collection('UserDataCollection')
                                .doc(users[index].id) // Delete by document ID
                                .delete();

                            await deleteImage(user[
                                'ImageURL']); // Assuming you have the imageUrl in your model
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
