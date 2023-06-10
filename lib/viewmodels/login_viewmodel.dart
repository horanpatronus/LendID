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
      FirebaseFirestore.instance.collection('users');

  UserModel? currentUser;

  Future<bool> loginUser(String email, String password) async {
    try {
      final passwordBytes =
          utf8.encode(password); // Convert entered password to bytes
      final hashedPassword =
          sha256.convert(passwordBytes).toString(); // Generate hash value

      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: hashedPassword,
      );

      await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);

      // Proceed to retrieve user data or navigate to the next screen
      return true;
    } catch (e) {
      // Handle authentication error
      print('Error signing in: $e');
      return false;
    }
  }

  Future<void> getCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await usersCollection.doc(user.uid).get();
      if (snapshot.exists) {
        currentUser = UserModel(
          email: snapshot.get('email'),
          nama: snapshot.get('nama'),
          password: snapshot.get('password'),
          role: snapshot.get('role'),
          saldo: snapshot.get('saldo'),
        );
      } else {
        if (kDebugMode) {
          print('gagal mendapatkan user');
        }
      }
    }
  }
}
