import 'package:flutter/foundation.dart';
import 'package:homepage/models/investasi_investor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homepage/models/pinjaman_umkm_model.dart';

abstract class BaseViewModel<T extends ChangeNotifier?> extends ChangeNotifier {
  T? state;

  void setState(T? newState) {
    state = newState;
    notifyListeners();
  }
}

class InvestasiInvestorViewModel extends BaseViewModel<ChangeNotifier?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference investasiInvestorCollection =
      FirebaseFirestore.instance.collection('investasi_investor');
  final CollectionReference pinjamanUmkmCollection =
      FirebaseFirestore.instance.collection('pinjaman_umkm');

  InvestasiInvestorModel? investasiData;
  PinjamanUmkmModel? pinjamanData;
  int totalInvestasi = 0;
  int totalSelesai = 0;
  int jumlahDanaDiberikan = 0;
  int estimasiHasil = 0;

  Future<void> getInvestasiInvestor() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot snapshot = await investasiInvestorCollection
          .where('user_id', isEqualTo: user.uid)
          .where('status', isEqualTo: 'Terkonfirmasi Admin')
          .get();

      if (snapshot.docs.isNotEmpty) {
        for (var document in snapshot.docs) {
          // Retrieve and process each document here
          investasiData = InvestasiInvestorModel(
            danaDiberikan: document.get('dana_diberikan'),
            proyekId: document.get('proyek_id'),
            status: document.get('status'),
            tanggalMulai: document.get('tanggal_mulai'),
            userId: document.get('user_id'),
          );

          QuerySnapshot umkmDocument = await pinjamanUmkmCollection
              .where(FieldPath.documentId, isEqualTo: investasiData?.proyekId)
              .get();

          if (umkmDocument.docs.isNotEmpty) {
            pinjamanData = PinjamanUmkmModel(
              periodePembayaran: umkmDocument.docs[0].get('periode_pembayaran'),
              status: umkmDocument.docs[0].get('status'),
            );

            if (pinjamanData?.status == 'Selesai') {
              totalSelesai++;
            } else {
              totalInvestasi++;
            }
          }

          jumlahDanaDiberikan += investasiData?.danaDiberikan ?? 0;
          // estimasiHasil
        }
      }
    }
  }
}
