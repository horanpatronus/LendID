import 'package:cloud_firestore/cloud_firestore.dart';

class InvestasiInvestorModel {
  final int? danaDiberikan;
  final String? proyekId;
  final String? status;
  final Timestamp? tanggalMulai;
  final String? userId;

  InvestasiInvestorModel({
    this.danaDiberikan,
    this.proyekId,
    this.status,
    this.tanggalMulai,
    this.userId,
  });
}
