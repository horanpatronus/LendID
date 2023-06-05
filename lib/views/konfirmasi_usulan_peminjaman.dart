import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';
import 'package:homepage/viewmodels/pinjaman_umkm_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';

class KonfirmasiUsulanPeminjaman extends StatefulWidget {
  const KonfirmasiUsulanPeminjaman({Key? key, required this.pinjamanViewModel})
      : super(key: key);

  final PinjamanUmkmViewModel pinjamanViewModel;

  @override
  KonfirmasiUsulanPeminjamanState createState() {
    return KonfirmasiUsulanPeminjamanState();
  }
}

class KonfirmasiUsulanPeminjamanState
    extends State<KonfirmasiUsulanPeminjaman> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  String? _errorMessage;
  final textEditControllerPassword = TextEditingController();
  final User? currentUser = FirebaseAuth.instance.currentUser;

  void tampilkanDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pembayaran Berhasil!'),
          content: Text('Terima kasih telah melakukan peminjaman!'),
          actions: <Widget>[
            TextButton(
              child: const Text('Kembali'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Konfirmasi Usulan Peminjaman Page',
        home: Scaffold(
          backgroundColor: Color(0xfff5f5f5),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    // container judul //
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 30, bottom: 10),
                      child: const Text(
                        'Konfirmasi Peminjaman',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff005555),
                            fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                    ),

                    // container utama //
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 0.5,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          color: Color(0xffffffff),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff00000),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.pinjamanViewModel.pinjamanData
                                                ?.namaProyek ??
                                            '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff005555),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        widget.pinjamanViewModel.pinjamanData
                                                ?.deskripsiProyek ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff0055555),
                                        ),
                                        textAlign: TextAlign.justify,
                                        overflow: TextOverflow.clip,
                                        maxLines: 3,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Jumlah Pinjaman'),
                                    Text(
                                        ('Rp' +
                                            NumberFormat('#,###', 'id_ID')
                                                .format(widget
                                                    .pinjamanViewModel
                                                    .pinjamanData
                                                    ?.jumlahPinjaman) +
                                            ',-'),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Periode Pembayaran'),
                                    Text(
                                        ((widget.pinjamanViewModel.pinjamanData
                                                    ?.periodePembayaran
                                                    .toString() ??
                                                '') +
                                            ' bulan'),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Banyaknya Cicilan'),
                                    Text(
                                        ((widget.pinjamanViewModel.pinjamanData
                                                    ?.periodePembayaran
                                                    .toString() ??
                                                '') +
                                            ' kali'),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Bunga yang Dikenai'),
                                Text(
                                    ((widget.pinjamanViewModel.pinjamanData
                                                ?.periodePembayaran
                                                .toString() ??
                                            '') +
                                        '%'),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Besaran Cicilan per Bulan'),
                                Text(
                                    ('Rp' +
                                        (NumberFormat('#,###', 'id_ID').format((((widget
                                                        .pinjamanViewModel
                                                        .pinjamanData
                                                        ?.jumlahPinjaman ??
                                                    0)) /
                                                (widget
                                                        .pinjamanViewModel
                                                        .pinjamanData
                                                        ?.periodePembayaran ??
                                                    0)) *
                                            (1 +
                                                (widget
                                                            .pinjamanViewModel
                                                            .pinjamanData
                                                            ?.periodePembayaran ??
                                                        0) /
                                                    100)))),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text('Konfirmasi Password'),
                                ),
                                Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.amber),
                                ),
                                Expanded(
                                  child: TextField(
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    controller: textEditControllerPassword,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Masukkan password anda'),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              _errorMessage ?? '',
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),

                            CheckboxListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: const Text(
                                'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.',
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.clip,
                                maxLines: 3,
                              ),
                              value: isChecked1, //boolean
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {
                                setState(() {
                                  // isChecked1 = !isChecked1;
                                  isChecked1 = value ?? false;
                                });
                              },
                            ),

                            CheckboxListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: const Text(
                                'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.',
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.clip,
                                maxLines: 3,
                              ),
                              value: isChecked2, //boolean
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked2 = value ?? false;
                                });
                              },
                            ),

                            Container(
                                height: 100,
                                color: Color(0xfff5f5f5),
                                padding: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        Color(0xff069A8E), // Background color
                                  ),
                                  onPressed: () async {
                                    if (isChecked1 && isChecked2) {
                                      final currentUser = this.currentUser;

                                      if (currentUser != null) {
                                        // if password is correct then save data to database
                                        final passwordBytes = utf8.encode(
                                            textEditControllerPassword.text);
                                        final hashedPassword = sha256
                                            .convert(passwordBytes)
                                            .toString();

                                        final AuthCredential credential =
                                            EmailAuthProvider.credential(
                                                email: currentUser.email!,
                                                password: hashedPassword);

                                        try {
                                          await currentUser
                                              .reauthenticateWithCredential(
                                                  credential);
                                          // If password is correct, save data to database
                                          widget.pinjamanViewModel
                                              .newUsulanPeminjaman();
                                          tampilkanDialog(context);
                                        } catch (e) {
                                          setState(() {
                                            _errorMessage = 'Password salah!';
                                          });
                                        }
                                      }
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Usulkan Peminjaman',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                            // ),
                          ],
                        ),
                      ),
                    ),

                    // Container(
                    //   height: 100,
                    //   color: Color(0xfff5f5f5),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(20),
                    //     child: ElevatedButton(
                    //       onPressed: () {},
                    //       style: ElevatedButton.styleFrom(
                    //         primary: Color(0xff005555), // Background color
                    //       ),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Text(
                    //             'Lanjutkan',
                    //             style: TextStyle(
                    //               fontSize: 15, fontWeight: FontWeight.bold
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     )
                    //   ),
                    // ),
                  ],
                ),
              ),
              Navigasi(),
              NavigasiMid(),
            ],
          ),
        ));
  }
}
