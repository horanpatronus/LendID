class UserModel {
  final String email;
  String? foto;
  String? ktp;
  String nama;
  String password;
  final String role;
  int? saldo;
  Map<String, dynamic>? perusahaan;

  UserModel({
    required this.email,
    this.foto,
    this.ktp,
    required this.nama,
    required this.password,
    required this.role,
    this.saldo,
    this.perusahaan,
  });
}
