import 'package:flutter/material.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

class KonfirmasiUsulanPeminjaman extends StatefulWidget {
  const KonfirmasiUsulanPeminjaman({Key? key}) : super(key: key);
  @override
  KonfirmasiUsulanPeminjamanState createState() {
    return KonfirmasiUsulanPeminjamanState();
  }
}

class KonfirmasiUsulanPeminjamanState
    extends State<KonfirmasiUsulanPeminjaman> {
  bool isChecked1 = false;
  bool isChecked2 = false;

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
                                        'Proyek Proyekan',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff005555),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.',
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
                                    Text('Rp6.000.000',
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
                                    Text('12 bulan',
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
                                    Text('12 kali',
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
                                Text('12%',
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
                                Text('Rp560.000,00',
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
                                Text('Konfirmasi Password'),
                                Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.amber),
                                )
                                // textformfield
                                // Container(child: Form(
                                //   child: TextFormField(
                                //     decoration: InputDecoration(labelText: 'Password'),
                                //     obscureText: true,
                                //   ),
                                //  ),),
                              ],
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
                                  onPressed: () {
                                    if (isChecked1 && isChecked2) {
                                      tampilkanDialog(context);
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
