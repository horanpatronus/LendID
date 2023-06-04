import 'package:flutter/foundation.dart';
import 'package:homepage/models/pinjaman_umkm_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseViewModel<T extends ChangeNotifier?> extends ChangeNotifier {
  T? state;

  void setState(T? newState) {
    state = newState;
    notifyListeners();
  }
}

class PinjamanUmkmViewModel extends BaseViewModel<ChangeNotifier?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference pinjamanUmkmCollection =
      FirebaseFirestore.instance.collection('pinjaman_umkm');

  PinjamanUmkmModel? pinjamanData;
  int totalPeminjaman = 0;
  int jumlahPinjaman = 0;
  int jumlahDibayar = 0;
  int sisaHutang = 0;

  Future<void> getPinjamanUmkm() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot snapshot = await pinjamanUmkmCollection
          .where('user_id', isEqualTo: user.uid)
          .get();
      if (snapshot.docs.isNotEmpty) {
        for (var document in snapshot.docs) {
          // Retrieve and process each document here
          pinjamanData = PinjamanUmkmModel(
            banyakCicilan: document.get('banyaknya_cicilan'),
            banyakCicilanLunas: document.get('cicilan_sudah_dibayar'),
            deskripsiProyek: document.get('deskripsi_proyek'),
            foto: document.get('foto'),
            jumlahDibayar: document.get('jumlah_dibayar'),
            jumlahPinjaman: document.get('jumlah_pinjaman'),
            namaProyek: document.get('nama_proyek'),
            periodePembayaran: document.get('periode_pembayaran'),
            status: document.get('status'),
            tenggatPelunasan: document.get('tenggat_pelunasan'),
            waktuPeminjaman: document.get('waktu_peminjaman'),
          );

          totalPeminjaman++;
          jumlahPinjaman += pinjamanData?.jumlahPinjaman ?? 0;
          jumlahDibayar += pinjamanData?.jumlahDibayar ?? 0;
        }

        sisaHutang = jumlahPinjaman - jumlahDibayar;
      }
    }
  }
}
