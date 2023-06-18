import 'package:flutter/foundation.dart';
import 'package:homepage/models/pinjaman_umkm_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homepage/views/usulan_peminjaman.dart';

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
  List<PinjamanUmkmModel> pinjamanList = [];
  int totalPeminjaman = 0;
  double jumlahPinjaman = 0;
  int jumlahDibayar = 0;
  double sisaHutang = 0;

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
            id: document.id,
            banyakCicilanLunas: document.get('cicilan_sudah_dibayar'),
            deskripsiProyek: document.get('deskripsi_proyek'),
            jumlahDibayar: document.get('jumlah_dibayar'),
            jumlahPinjaman: document.get('jumlah_pinjaman'),
            namaProyek: document.get('nama_proyek'),
            periodePembayaran: document.get('periode_pembayaran'),
            status: document.get('status'),
            tenggatPelunasan: document.get('tenggat_pelunasan'),
            waktuPeminjaman: document.get('waktu_peminjaman'),
            waktuPengajuan: document.get('waktu_pengajuan'),
          );

          if (pinjamanData?.status != 'Selesai' &&
              pinjamanData?.status != 'Menunggu Konfirmasi') {
            totalPeminjaman++;
            jumlahPinjaman += (pinjamanData?.jumlahPinjaman ?? 0) *
                (1 + ((pinjamanData?.periodePembayaran ?? 0) / 100));
            jumlahDibayar += pinjamanData?.jumlahDibayar ?? 0;

            if (pinjamanData != null) {
              pinjamanList?.add(pinjamanData!);
            }
          }
        }

        sisaHutang = jumlahPinjaman - jumlahDibayar;
      }
    }
  }

  void handleUsulanPeminjamanData(PinjamanUmkmModel data) {
    pinjamanData = data;
  }

  Future<void> newUsulanPeminjaman() async {
    try {
      User? user = _auth.currentUser;

      await pinjamanUmkmCollection.doc().set({
        'cicilan_sudah_dibayar': 0,
        'deskripsi_proyek': pinjamanData?.deskripsiProyek,
        'jumlah_dibayar': 0,
        'jumlah_pinjaman': pinjamanData?.jumlahPinjaman,
        'nama_proyek': pinjamanData?.namaProyek,
        'periode_pembayaran': pinjamanData?.periodePembayaran,
        'status': pinjamanData?.status,
        'tenggat_pelunasan': pinjamanData?.waktuPeminjaman?.toDate().add(
                Duration(
                    days: (30 * (pinjamanData?.periodePembayaran ?? 0)))) ??
            Timestamp.now(),
        'user_id': user!.uid,
        'waktu_pengajuan': pinjamanData?.waktuPengajuan,
        'waktu_peminjaman': pinjamanData?.waktuPeminjaman,
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error: Gagal membuat usulan peminjaman, $e');
      }
    }
  }

  Future<void> updatePinjaman(PinjamanUmkmModel data) async {
    try {
      await pinjamanUmkmCollection.doc(data.id).update({
        'cicilan_sudah_dibayar': data.banyakCicilanLunas! + 1,
        'jumlah_dibayar': data.jumlahDibayar,
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error: Gagal mengupdate peminjaman, $e');
      }
    }
  }
}
