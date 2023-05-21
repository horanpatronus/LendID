import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('user');

  Future<bool> loginUser(String email, String password) async {
    try {
      final QuerySnapshot snapshot = await usersCollection
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
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
