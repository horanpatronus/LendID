class UserModel {
  final String email;
  final String foto;
  final String ktp;
  final String nama;
  final String password;
  final String role;
  final int saldo;
  final Map<String, dynamic> perusahaan;

  UserModel({
    required this.email,
    required this.foto,
    required this.ktp,
    required this.nama,
    required this.password,
    required this.role,
    required this.saldo,
    required this.perusahaan,
  });
}
