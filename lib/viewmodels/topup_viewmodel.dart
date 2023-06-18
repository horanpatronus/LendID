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

class TopUpViewModel extends BaseViewModel<ChangeNotifier?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  CollectionReference riwayatTopupCollection =
      FirebaseFirestore.instance.collection('riwayat_topup');

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

  Future<void> updateSaldo(int withdrawAmount) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;

      if (user != null) {
        final usersCollection = FirebaseFirestore.instance.collection('users');
        final userDocument = usersCollection.doc(user.uid);

        final userSnapshot = await userDocument.get();

        if (userSnapshot.exists) {
          final currentSaldo = userSnapshot.data()?['saldo'] ?? 0;
          final newSaldo = currentSaldo - withdrawAmount;

          await userDocument.update({
            'saldo': newSaldo,
          });

          //add data to riwayat topup collection
          await riwayatTopupCollection.add({
            'uid': user.uid,
            'jenis': 'Withdraw',
            'amount': withdrawAmount,
            'date': FieldValue.serverTimestamp(),
          });

          currentUser?.saldo = newSaldo;
          notifyListeners();
        } else {
          if (kDebugMode) {
            print('User document does not exist');
          }
        }
      } else {
        if (kDebugMode) {
          print('Failed to get current user');
        }
      }
    } catch (error) {
      print('Error updating saldo: $error');
    }
  }
}
