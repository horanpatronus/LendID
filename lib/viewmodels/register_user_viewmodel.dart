import '../models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterViewModel {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('user');

  Future<void> registerUser(UserModel user) async {
    try {
      await usersCollection.add({
        'email': user.email,
        'foto': user.foto,
        'ktp': user.ktp,
        'nama': user.nama,
        'password': user.password,
        'role': user.role,
        'saldo': user.saldo,
        'perusahaan': user.perusahaan,
      });
    } catch (e) {
      // Handle error
      print('Error registering user: $e');
    }
  }
}
