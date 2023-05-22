import 'package:flutter/material.dart';
import 'package:homepage/viewmodels/login_viewmodel.dart';
import 'package:homepage/views/register_user_view.dart';
import 'package:homepage/views/landing_page.dart';

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

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final LoginViewModel _viewModel = LoginViewModel();
  final textEditControllerEmail = TextEditingController();
  final textEditControllerPassword = TextEditingController();
  String _email = "";
  String _password = "";
  String? _errorMessage;

  @override
  void dispose() {
    textEditControllerEmail.dispose();
    textEditControllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // main
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Page',
        home: Scaffold(
            appBar: AppBar(
              // leading:Image.asset("images/logo_lendid.png", height: 20,),
              backgroundColor: const Color(0xFF005555),
              title: const Text('Login Page'), // judul di header app
            ),
            body: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  height: 150,
                  width: 190,
                  padding: const EdgeInsets.only(top: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                  ),
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
                    'Log In',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Silakan log in untuk melanjutkan.',
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 102, 102, 102)),
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
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: textEditControllerPassword,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Masukkan password yang aman'),
                    ),
                  ),
                ),
                Text(
                  _errorMessage ?? '',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () async {
                      _email = textEditControllerEmail.text;
                      _password = textEditControllerPassword.text;
                      final loggedIn =
                          await _viewModel.loginUser(_email, _password);

                      if (loggedIn) {
                        // Navigate to the landing page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LandingPage(),
                          ),
                        );
                      } else {
                        setState(() {
                          _errorMessage =
                              'E-mail atau password yang anda masukkan salah!';
                        });
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'LOG IN',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.navigate_next_sharp,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Belum memiliki akun?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //pergi ke halaman search button
                            builder: (context) => const RegisterUserView(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: const Color(0xff069a8e)),
                      child: const Text(
                        'Sign up',
                      ),
                    )
                  ],
                ),
                // Text(
                //   'Halo email kamu $_email, password kamu $_password',
                //   style: const TextStyle(
                //       fontSize: 30,
                //       fontWeight: FontWeight.bold,
                //       color: Color.fromARGB(255, 120, 214, 13)),
                // ),
              ]),
            )));
  }
}
