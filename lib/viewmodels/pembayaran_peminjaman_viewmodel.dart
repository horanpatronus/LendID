import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homepage/models/pembayaran_peminjaman_model.dart';

abstract class BaseViewModel<T extends ChangeNotifier?> extends ChangeNotifier {
  T? state;

  void setState(T? newState) {
    state = newState;
    notifyListeners();
  }
}

class PembayaranPeminjamanViewModel extends BaseViewModel<ChangeNotifier?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference pembayaranPeminjamanCollection =
      FirebaseFirestore.instance.collection('transaksi');
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  List<PembayaranPeminjamanModel> pembayaranList = [];

  Future<void> getPembayaranPeminjaman() async {
    User? user = _auth.currentUser;

    if (user != null) {
      QuerySnapshot snapshot = await pembayaranPeminjamanCollection
          .where('user_id', isEqualTo: user.uid)
          .get();

      if (snapshot.docs.isNotEmpty) {
        for (var document in snapshot.docs) {
          var pembayaranData = PembayaranPeminjamanModel(
            proyekId: document.get('proyek_id'),
            tanggalPembayaran: document.get('tanggal_pembayaran'),
            totalPembayaran: document.get('total_pembayaran'),
            userId: user.uid,
          );

          pembayaranList.add(pembayaranData);
        }
      }
    }
  }

  Future<void> newPembayaranPeminjaman(PembayaranPeminjamanModel data) async {
    try {
      User? user = _auth.currentUser;
      await pembayaranPeminjamanCollection.doc().set({
        'proyek_id': data.proyekId,
        'tanggal_pembayaran': data.tanggalPembayaran,
        'total_pembayaran': data.totalPembayaran,
        'user_id': user!.uid,
      });

      DocumentSnapshot snapshot = await usersCollection.doc(user.uid).get();

      await usersCollection.doc(user.uid).update({
        'saldo': snapshot.get('saldo') - data.totalPembayaran,
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error: Gagal menambahkan pembayaran pinjaman, $e');
      }
    }
  }
}
