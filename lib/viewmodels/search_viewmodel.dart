import 'package:flutter/foundation.dart';
import 'package:homepage/models/pinjaman_umkm_model.dart';
import 'package:homepage/models/investasi_investor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseViewModel<T extends ChangeNotifier?> extends ChangeNotifier {
  T? state;

  void setState(T? newState) {
    state = newState;
    notifyListeners();
  }
}

class SearchViewModel extends BaseViewModel<ChangeNotifier?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference pinjamanUmkmCollection =
      FirebaseFirestore.instance.collection('pinjaman_umkm');

  InvestasiInvestorModel? investasiData;
  PinjamanUmkmModel? pinjamanData;
  int totalInvestasi = 0;
  int jumlahPinjaman = 0;
  int jumlahDibayar = 0;
}
