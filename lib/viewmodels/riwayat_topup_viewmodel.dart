import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:homepage/models/user_model.dart';

import '../models/topup_model.dart';

abstract class BaseViewModel<T extends ChangeNotifier?> extends ChangeNotifier {
  T? state;

  void setState(T? newState) {
    state = newState;
    notifyListeners();
  }
}

class RiwayatTopUpViewModel extends BaseViewModel<ChangeNotifier?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  UserModel? currentUser;

  Future<void> getCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await usersCollection.doc(user.uid).get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        currentUser = UserModel(
          email: data['email'],
          nama: data['nama'],
          password: data['password'],
          role: data['role'],
          ktp: data['ktp'] as String?,
          saldo: data['saldo'],
        );
      } else {
        if (kDebugMode) {
          print('gagal mendapatkan user');
        }
      }
    }
  }

  List<TopUpModel> riwayatTopUp = [];

  Future<void> getRiwayatTopUp() async {
    await getCurrentUser();

    if (currentUser != null) {
      QuerySnapshot snapshot = await usersCollection
          .doc(currentUser!.email)
          .collection('riwayat_topup')
          .get();

      riwayatTopUp = snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        return TopUpModel(
          jenis: data['jenis'],
          amount: data['amount'],
          date: data['date'],
        );
      }).toList();

      notifyListeners();
    }
  }
}
