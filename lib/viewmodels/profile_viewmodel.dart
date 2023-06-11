import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:homepage/models/user_model.dart';

abstract class BaseViewModel<T extends ChangeNotifier?> extends ChangeNotifier {
  T? state;

  void setState(T? newState) {
    state = newState;
    notifyListeners();
  }
}

class ProfileViewModel extends BaseViewModel<ChangeNotifier?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  UserModel? currentUser;

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
        );
      } else {
        if (kDebugMode) {
          print('gagal mendapatkan user');
        }
      }
    }
  }
}
