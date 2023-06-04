import 'dart:convert';

import '../models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterViewModel {
  UserModel? userData;
  String? selectedRole;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  void handleUserData(UserModel data) {
    userData = data;
  }

  void handleSelectedRole(String role) {
    selectedRole = role;
  }

  Future<void> registerUser() async {
    try {
      final passwordBytes =
          utf8.encode(userData?.password ?? ''); // Convert password to bytes
      final hashedPassword =
          sha256.convert(passwordBytes).toString(); // Generate hash value

      // Create a new user in Firebase Authentication
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userData?.email ?? '',
        password: hashedPassword,
      );

      // Get the newly created user's ID
      final String userId = userCredential.user!.uid;

      // Store user data in Firestore
      await usersCollection.doc(userId).set({
        'documentId': userId,
        'email': userData?.email,
        'nama': userData?.nama,
        'password': hashedPassword,
        'role': selectedRole,
        'saldo': 0,
      });

      // Update the user profile in Firebase Authentication
      final User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        await currentUser.updateDisplayName(userData?.nama ?? '');
      }

      // Registration completed successfully
    } catch (e) {
      // Handle error
      print('Error registering user: $e');
    }
  }
}
