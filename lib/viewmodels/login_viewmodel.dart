import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';

import 'package:homepage/models/user_model.dart';

abstract class BaseViewModel<T extends ChangeNotifier?> extends ChangeNotifier {
  T? state;

  void setState(T? newState) {
    state = newState;
    notifyListeners();
  }
}

class LoginViewModel extends BaseViewModel<ChangeNotifier?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('user');

  UserModel? currentUser;

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

  Future<void> getCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await usersCollection.doc(user.uid).get();
      currentUser = UserModel(
        email: snapshot.get('email'),
        nama: snapshot.get('nama'),
        password: snapshot.get('password'),
        role: snapshot.get('role'),
      );
    }
  }
}
