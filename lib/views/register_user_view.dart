import 'package:flutter/material.dart';
import 'package:homepage/viewmodels/register_user_viewmodel.dart';
import 'package:homepage/models/user_model.dart';
import 'package:homepage/views/login_page.dart';
import 'package:homepage/views/choose_role.dart';

class RegisterUserView extends StatefulWidget {
  const RegisterUserView({Key? key}) : super(key: key);

  @override
  _RegisterUserViewState createState() => _RegisterUserViewState();
}

class _RegisterUserViewState extends State<RegisterUserView> {
  final RegisterViewModel _userViewModel = RegisterViewModel();
  final textEditControllerNamaLengkap = TextEditingController();
  final textEditControllerEmail = TextEditingController();
  final textEditControllerPassword = TextEditingController();
  final textEditControllerKonfirmasiPassword = TextEditingController();
  String _namaLengkap = "";
  String _email = "";
  String _password = "";
  String _konfirmasiPassword = "";

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Masukkan alamat email yang valid'
        : null;
  }

  RegExp passwordValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  bool validatePassword(String pass) {
    String password = pass.trim();
    if (passwordValid.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    textEditControllerNamaLengkap.dispose();
    textEditControllerEmail.dispose();
    textEditControllerPassword.dispose();
    textEditControllerKonfirmasiPassword.dispose();
    super.dispose();
  }

  void registerUser() {
    UserModel user = UserModel(
      email: textEditControllerEmail.text,
      foto: '', // Set the value accordingly
      ktp: '', // Set the value accordingly
      nama: textEditControllerNamaLengkap.text,
      password: textEditControllerPassword.text,
      role: '', // Set the value accordingly
      saldo: 0, // Set the value accordingly
      perusahaan: {}, // Set the value accordingly
    );

    _userViewModel.handleUserData(user);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChooseRole(
          userViewModel: _userViewModel,
          onRoleSelected: _userViewModel.handleSelectedRole,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // main
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Register Page',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff005555),
              title: const Text('Register Page'), // judul di header app
            ),
            body: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  height: 150,
                  width: 190,
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: Image.asset(
                      "lendid_trans.png",
                      height: 150,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Silakan sign up untuk melanjutkan.',
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 102, 102, 102)),
                ),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                        controller: textEditControllerNamaLengkap,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nama Lengkap',
                        ),
                        validator: (val) {
                          if (val == null) return 'Nama tidak boleh kosong';
                          return null;
                        }),
                  ),
                ),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      validator: validateEmail,
                      controller: textEditControllerEmail,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText:
                              'Masukkan email yang valid, seperti abc@gmail.com'),
                    ),
                  ),
                ),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: textEditControllerPassword,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Masukkan password yang aman'),
                      validator: (val) {
                        if (val == null) {
                          return "Silakan masukkan password yang unik";
                        } else {
                          //call function to check password
                          bool result = validatePassword(val);
                          if (result) {
                            // create account event
                            return null;
                          } else {
                            return "Password harus mengandung huruf kapital, huruf kecil, angka, dan tanda spesial";
                          }
                        }
                      },
                    ),
                  ),
                ),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: textEditControllerKonfirmasiPassword,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Konfirmasi Password',
                        ),
                        validator: (val) {
                          if (val == null) return 'Password tidak boleh kosong';
                          if (val != textEditControllerPassword.text) {
                            return 'Password tidak sesuai';
                          }
                          return null;
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _namaLengkap = textEditControllerNamaLengkap.text;
                        _email = textEditControllerEmail.text;
                        _password = textEditControllerPassword.text;
                        _konfirmasiPassword =
                            textEditControllerKonfirmasiPassword.text;
                      });
                      if (textEditControllerPassword.text ==
                          textEditControllerKonfirmasiPassword.text) {
                        registerUser();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChooseRole(
                              userViewModel: _userViewModel,
                              onRoleSelected: _userViewModel.handleSelectedRole,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text('NEXT'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Sudah memiliki akun?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: const Color(0xff069a8e)),
                      child: const Text(
                        'Sign in',
                      ),
                    )
                  ],
                ),
              ]),
            )));
  }
}
