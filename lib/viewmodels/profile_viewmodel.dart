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
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        currentUser = UserModel(
          email: data['email'],
          nama: data['nama'],
          password: data['password'],
          role: data['role'],
          ktp: data['ktp'] as String?,
          perusahaan: data.containsKey('perusahaan')
              ? data['perusahaan'] as Map<String, dynamic>?
              : null,
        );
      } else {
        if (kDebugMode) {
          print('gagal mendapatkan user');
        }
      }
    }
  }

  Future<void> updateProfile(String name, String ktp) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await usersCollection.doc(user.uid).update({
        'nama': name,
        'ktp': ktp,
      });
      currentUser?.nama = name;
      currentUser?.ktp = ktp;
      notifyListeners();
    }
  }

  Future<void> updateCompanyProfile(
      String nama, String alamat, String npwp, int penghasilan) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await usersCollection.doc(user.uid).update({
        'perusahaan.nama': nama,
        'perusahaan.alamat': alamat,
        'perusahaan.npwp': npwp,
        'perusahaan.penghasilan': penghasilan,
      });
      currentUser?.perusahaan?['nama'] = nama;
      currentUser?.perusahaan?['alamat'] = alamat;
      currentUser?.perusahaan?['npwp'] = npwp;
      currentUser?.perusahaan?['penghasilan'] = penghasilan;

      notifyListeners();
    }
  }
}
