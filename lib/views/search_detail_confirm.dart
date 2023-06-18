import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homepage/models/pinjaman_umkm_model.dart';
import 'package:homepage/models/user_model.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';
import 'package:homepage/views/profile_user.dart';

import 'package:homepage/views/progress_bar.dart';
import 'package:homepage/views/search.dart';
import 'package:homepage/views/search_detail.dart';
import 'package:homepage/views/search_detail_confirm.dart';
import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';

class SearchConfirm extends StatefulWidget {
  final String idProyek;
  final PinjamanUmkmModel model;

  const SearchConfirm({Key? key, required this.idProyek, required this.model})
      : super(key: key);

  @override
  State<SearchConfirm> createState() => _SearchConfirmState();
}

class _SearchConfirmState extends State<SearchConfirm> {
  late String idProyek;
  late PinjamanUmkmModel model;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  UserModel? currentUser;

  final textEditControllerPassword = TextEditingController();
  final textEditControllerJumlah = TextEditingController();

  bool _validateAmount = false;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    idProyek = widget.idProyek;
    model = widget.model;

    getCurrentUser();
  }

  Future<UserModel?> getCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await usersCollection.doc(user.uid).get();
      if (snapshot.exists) {
        currentUser = UserModel(
          email: snapshot.get('email'),
          nama: snapshot.get('nama'),
          password: snapshot.get('password'),
          role: snapshot.get('role'),
          saldo: snapshot.get('saldo'),
        );
        return currentUser;
      } else {
        if (kDebugMode) {
          print('Failed to get user');
        }
        return null;
      }
    }
    return null;
  }

  final String LoremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_isChecked1 && _isChecked2) {
        // Simulate success message with a popup for a few seconds
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                height: 300,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Color(0xff005555),
                      size: 150,
                    ),
                    Text(
                      "Pembayaran Berhasil",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Terima kasih telah melakukan investasi",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Color(0xff005555)),
                  ),
                ),
              ],
            );
          },
        );

        // Reset form after success
        _formKey.currentState!.reset();
        _isChecked1 = false;
        _isChecked2 = false;
      } else {
        // Show error message
        setState(() {
          _validateAmount = false;
        });
      }
    } else {
      // Show error message
      setState(() {
        _validateAmount = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: ListView(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              //pergi ke halaman akun
                              builder: (context) => ProfilePage(),
                            ),
                          );
                        },
                        child: Icon(Icons.arrow_back)),
                    Text("Konfirmasi Investasi")
                  ],
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xffA1E3D8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(
                                    0, 3), // Mengatur posisi bayangan (x, y)
                              ),
                            ],
                          ),
                          child: Center(
                              child: Text(
                            "UMKM Aku Laku",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 600,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xffA1E3D8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(
                                    0, 3), // Mengatur posisi bayangan (x, y)
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                        "https://picsum.photos/id/1023/100/100",
                                      ),
                                      fit: BoxFit.cover,
                                      height: 50,
                                      width: 50,
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${model.namaProyek}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              model.deskripsiProyek ?? '',
                                              style: TextStyle(fontSize: 10),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Text("Detail Proyek"),
                                    Text(
                                      "Rp${NumberFormat('#,###', 'id_ID').format(model.jumlahPinjaman ?? 0)},-",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Text("Imbal"),
                                    Text(
                                      "${model.periodePembayaran}%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                              ),
                              Divider(
                                // Garis horizontal
                                color: Colors.black,
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Saldo Anda"),
                                    FutureBuilder<UserModel?>(
                                      future: getCurrentUser(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          // Show a loading indicator while fetching the user data
                                          return CircularProgressIndicator();
                                        } else if (snapshot.hasError) {
                                          // Show an error message if an error occurred
                                          return Text(
                                              'Error: ${snapshot.error}');
                                        } else {
                                          // Show the saldo when the user data is available
                                          UserModel? currentUser =
                                              snapshot.data;
                                          return Text(
                                            "Rp${NumberFormat('#,###', 'id_ID').format(currentUser?.saldo ?? 0)},-",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Jumlah Investasi",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            margin: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                            ),
                                            child: TextField(
                                              controller:
                                                  textEditControllerJumlah,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                labelText: null,
                                                hintText:
                                                    "Masukkan jumlah investasi",
                                                hintStyle: TextStyle(
                                                  fontSize: 12,
                                                ),
                                                errorText: _validateAmount
                                                    ? 'Saldo tidak cukup!'
                                                    : null,
                                                errorStyle: TextStyle(
                                                  fontSize: 12,
                                                  // color: Colors.black,
                                                ),
                                              ),
                                              onChanged: (value) {
                                                if (int.tryParse(value) !=
                                                    null) {
                                                  int inputValue =
                                                      int.parse(value);
                                                  setState(() {
                                                    _validateAmount =
                                                        inputValue >
                                                            (currentUser
                                                                    ?.saldo ??
                                                                0);
                                                  });
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                // Garis horizontal
                                color: Colors.black,
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  children: [
                                    Text("Password"),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: TextField(
                                          obscureText: true,
                                          controller:
                                              textEditControllerPassword,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Masukkan password",
                                            hintStyle: TextStyle(
                                              fontSize: 12,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
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
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                              ),
                              Divider(
                                // Garis horizontal
                                color: Colors.black,
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: _isChecked1,
                                      activeColor: Color(0xff005555),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _isChecked1 = value!;
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(
                                          LoremIpsum,
                                          style: TextStyle(fontSize: 10),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: _isChecked2,
                                      activeColor: Color(0xff005555),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _isChecked2 = value!;
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(
                                          LoremIpsum,
                                          style: TextStyle(fontSize: 10),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final passwordBytes = utf8
                                      .encode(textEditControllerPassword.text);
                                  final hashedPassword =
                                      sha256.convert(passwordBytes).toString();

                                  final AuthCredential credential =
                                      EmailAuthProvider.credential(
                                          email: currentUser!.email,
                                          password: hashedPassword);

                                  try {
                                    User? user = _auth.currentUser;
                                    await user!.reauthenticateWithCredential(
                                        credential);
                                    // If password is correct, save data to database
                                    FirebaseFirestore.instance
                                        .collection('investasi_investor')
                                        .add({
                                      'dana_diberikan': int.parse(
                                          textEditControllerJumlah.text),
                                      'proyek_id': model.id,
                                      'tanggal_mulai': model.waktuPeminjaman,
                                      'user_id': user.uid,
                                    });

                                    usersCollection.doc(user.uid).update({
                                      'saldo': currentUser?.saldo != null
                                          ? currentUser!.saldo! -
                                              int.parse(
                                                  textEditControllerJumlah.text)
                                          : null,
                                    });
                                  } catch (e) {
                                    setState(() {
                                      _errorMessage = 'Password salah!';
                                    });
                                  }

                                  _submitForm;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchButton()),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xff005555),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Bayar",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              if (_validateAmount ||
                                  (!_isChecked1 || !_isChecked2))
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    _validateAmount
                                        ? 'Saldo tidak cukup!'
                                        : 'Anda harus mencentang kedua checkbox.',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                        )
                      ],
                    ))
              ],
            ),
          ),
          Navigasi(),
          NavigasiMid(),
        ]),
      ),
    );
  }
}
