import 'package:flutter/material.dart';

import 'choose_role.dart';
import 'landing_page.dart';
import 'login_page.dart';

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

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<SignUp> {
  final textEditControllerNamaLengkap = TextEditingController();
  final textEditControllerEmail = TextEditingController();
  final textEditControllerPassword = TextEditingController();
  final textEditControllerKonfirmasiPassword = TextEditingController();
  String _namaLengkap = "";
  String _email = "";
  String _password = "";
  String _konfirmasiPassword = "";

  RegExp passwordValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (passwordValid.hasMatch(_password))
      return true;
    else
      return false;
  }

  @override
  void dispose() {
    textEditControllerNamaLengkap.dispose();
    textEditControllerEmail.dispose();
    textEditControllerPassword.dispose();
    textEditControllerKonfirmasiPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // main
    return MaterialApp(
        title: 'Register Page',
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff005555),
              title: const Text('Register Page'), // judul di header app
            ),
            body: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  height: 150,
                  width: 190,
                  padding: EdgeInsets.only(top: 40),
                  child: Center(
                    child: Image.asset(
                      "images/logo_lendid.png",
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
                          if (val != textEditControllerPassword.text)
                            return 'Password tidak sesuai';
                          return null;
                        }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _namaLengkap = textEditControllerNamaLengkap.text;
                        _email = textEditControllerEmail.text;
                        _password = textEditControllerPassword.text;
                        _konfirmasiPassword =
                            textEditControllerKonfirmasiPassword.text;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //pergi ke halaman Login page
                          builder: (context) => ChooseRole(),
                        ),
                      );
                    },
                    child: const Text('NEXT'),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Text('Sudah memiliki akun?'),
                    TextButton(
                      child: const Text(
                        'Sign in',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //pergi ke halaman Login page
                            builder: (context) => Login_Page(),
                          ),
                        );
                        // pilih role screen
                      },
                      style: TextButton.styleFrom(primary: Color(0xff069a8e)),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Text(
                  'Halo $_namaLengkap, email kamu $_email, password kamu $_password, konfirmasi kamu $_konfirmasiPassword',
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 120, 214, 13)),
                ),
              ]),
            )));
  }
}
