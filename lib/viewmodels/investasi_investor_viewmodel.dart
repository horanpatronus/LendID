import 'package:flutter/foundation.dart';
import 'package:homepage/models/investasi_investor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homepage/models/pinjaman_umkm_model.dart';
import 'package:intl/intl.dart';

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
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  InvestasiInvestorModel? investasiData;
  PinjamanUmkmModel? pinjamanData;
  int totalInvestasi = 0;
  int totalSelesai = 0;
  int jumlahDanaDiberikan = 0;
  double estimasiHasil = 0;

  List<dynamic> mergedList = [];
  List<dynamic> mergedListSelesai = [];

  Future<void> getInvestasiInvestor() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot snapshot = await investasiInvestorCollection
          .where('user_id', isEqualTo: user.uid)
          .get();

      if (snapshot.docs.isNotEmpty) {
        List<DocumentSnapshot> riwayatInvestasi = snapshot.docs;
        mergedList = [];

        for (var document in riwayatInvestasi) {
          Map<String, dynamic> riwayatData =
              document.data() as Map<String, dynamic>;

          String danaDiberikan = riwayatData['dana_diberikan'].toString();
          double? danaDiberikanHitung = riwayatData['dana_diberikan'];
          String proyekId = riwayatData['proyek_id'];
          String userId = riwayatData['user_id'];

          DocumentSnapshot pinjamanDocument =
              await pinjamanUmkmCollection.doc(proyekId).get();

          if (pinjamanDocument.exists) {
            Map<String, dynamic> pinjamanData =
                pinjamanDocument.data() as Map<String, dynamic>;

            String namaProyek = pinjamanData['nama_proyek'];
            String deskripsiProyek = pinjamanData['deskripsi_proyek'];
            String statusPendanaan = pinjamanData['status'];
            String estimasiTanggal = pinjamanData['tenggat_pelunasan']
                .toDate()
                .toLocal()
                .toString()
                .split(' ')[0];

            // hitung estimasi
            double? bunga = pinjamanData['periode_pembayaran'];
            double? bungaInvestor = (bunga! / 100.0) / 2;
            double? estimasi =
                (danaDiberikanHitung! * bungaInvestor) + danaDiberikanHitung;
            String? estimasiHasilHitung = estimasi.toString();

            if (statusPendanaan == 'Selesai') {
              totalSelesai++;
              mergedListSelesai.add({
                'nama_pinjaman': namaProyek,
                'deskripsi_proyek': deskripsiProyek,
                'dana_diberikan': danaDiberikan,
                'estimasi_tanggal': estimasiTanggal,
                'status': statusPendanaan,
                'estimasi_hasil': estimasiHasilHitung,
                'proyek_id': proyekId,
                'user_id': userId,
              });
            } else {
              totalInvestasi++;
              mergedList.add({
                'nama_pinjaman': namaProyek,
                'deskripsi_proyek': deskripsiProyek,
                'dana_diberikan': danaDiberikan,
                'estimasi_tanggal': estimasiTanggal,
                'estimasi_hasil': estimasiHasilHitung,
                'status': statusPendanaan,
                'proyek_id': proyekId,
                'user_id': userId,
              });
            }

            jumlahDanaDiberikan += int.parse(danaDiberikan);
            estimasiHasil += int.parse(estimasiHasilHitung);
          }
        }
      }
    } else {
      if (kDebugMode) {
        print('gagal mendapatkan data investor');
      }
    }
  }
}
