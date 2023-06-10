import 'package:cloud_firestore/cloud_firestore.dart';

class PinjamanUmkmModel {
  final int? banyakCicilanLunas;
  final String? deskripsiProyek;
  final String? foto;
  final int? jumlahDibayar;
  final int? jumlahPinjaman;
  final String? namaProyek;
  final int? periodePembayaran;
  final String? status;
  final Timestamp? tenggatPelunasan;
  final String? userId;
  final Timestamp? waktuPeminjaman;
  final Timestamp? waktuPengajuan;

  PinjamanUmkmModel({
    this.banyakCicilanLunas,
    this.deskripsiProyek,
    this.foto,
    this.jumlahDibayar,
    this.jumlahPinjaman,
    this.namaProyek,
    this.periodePembayaran,
    this.status,
    this.tenggatPelunasan,
    this.userId,
    this.waktuPeminjaman,
    this.waktuPengajuan,
  });
}
