import 'package:cloud_firestore/cloud_firestore.dart';

class PembayaranPeminjamanModel {
  final String? proyekId;
  final Timestamp? tanggalPembayaran;
  final int? totalPembayaran;
  final String? userId;

  PembayaranPeminjamanModel({
    this.proyekId,
    this.tanggalPembayaran,
    this.totalPembayaran,
    this.userId,
  });
}
