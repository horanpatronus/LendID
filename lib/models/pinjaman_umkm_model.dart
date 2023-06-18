import 'package:cloud_firestore/cloud_firestore.dart';

class PinjamanUmkmModel {
  final String? id;
  final int? banyakCicilanLunas;
  final String? deskripsiProyek;
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
    this.id,
    this.banyakCicilanLunas,
    this.deskripsiProyek,
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

  factory PinjamanUmkmModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return PinjamanUmkmModel(
      id: snapshot.id,
      banyakCicilanLunas: data['cicilan_sudah_dibayar'],
      deskripsiProyek: data['deskripsi_proyek'],
      jumlahDibayar: data['jumlah_dibayar'],
      jumlahPinjaman: data['jumlah_pinjaman'],
      namaProyek: data['nama_proyek'],
      periodePembayaran: data['periode_pembayaran'],
      status: data['status'],
      tenggatPelunasan: data['tenggat_pelunasan'],
      userId: data['user_id'],
      waktuPeminjaman: data['waktu_peminjaman'],
      waktuPengajuan: data['waktu_pengajuan'],
    );
  }
}
