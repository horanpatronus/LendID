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

  factory InvestasiInvestorModel.fromDocumentSnapshot(
      DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return InvestasiInvestorModel(
      danaDiberikan: data['dana_diberikan'],
      proyekId: data['proyek_id'],
      status: data['status'],
      tanggalMulai: data['tanggal_mulai'],
      userId: data['user_id'],
    );
  }
}
