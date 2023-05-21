import 'dart:convert';

import '../models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';

class RegisterViewModel {
  UserModel? userData;
  String? selectedRole;

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('user');

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

      await usersCollection.add({
        'email': userData?.email,
        'nama': userData?.nama,
        'password': hashedPassword,
        'role': selectedRole,
      });
    } catch (e) {
      // Handle error
      print('Error registering user: $e');
    }
  }
}
