import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';

class LoginViewModel {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('user');

  Future<bool> loginUser(String email, String password) async {
    try {
      final passwordBytes =
          utf8.encode(password); // Convert entered password to bytes
      final hashedPassword =
          sha256.convert(passwordBytes).toString(); // Generate hash value

      final QuerySnapshot snapshot = await usersCollection
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: hashedPassword)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // User exists, login successful
        return true;
      } else {
        // User does not exist or invalid credentials
        return false;
      }
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print('Error logging in user: $e');
      }
      return false;
    }
  }
}
