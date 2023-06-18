import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homepage/models/pembayaran_peminjaman_model.dart';
import 'package:homepage/models/pinjaman_umkm_model.dart';
import 'package:homepage/viewmodels/pembayaran_peminjaman_viewmodel.dart';
import 'package:homepage/viewmodels/pinjaman_umkm_viewmodel.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';
import 'package:homepage/views/status_peminjaman_umkm.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'progress_bar.dart';

class DetailPeminjamanUMKM extends StatefulWidget {
  final PinjamanUmkmModel model;
  const DetailPeminjamanUMKM({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  DetailPeminjamanUMKMState createState() {
    return DetailPeminjamanUMKMState();
  }
}

class DetailPeminjamanUMKMState extends State<DetailPeminjamanUMKM> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PembayaranPeminjamanViewModel>(
          create: (_) => PembayaranPeminjamanViewModel(),
        ),
        ChangeNotifierProvider<PinjamanUmkmViewModel>(
          create: (_) => PinjamanUmkmViewModel(),
        ),
      ],
      child: Builder(builder: (context) {
        final pembayaranViewModel =
            Provider.of<PembayaranPeminjamanViewModel>(context);
        final pinjamanViewModel = Provider.of<PinjamanUmkmViewModel>(context);

        return FutureBuilder(
          future: Future.wait([pembayaranViewModel.getPembayaranPeminjaman()]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              PinjamanUmkmModel model = widget.model;

              DateTime waktuPeminjaman = model.waktuPeminjaman!
                  .toDate(); // Convert Timestamp to DateTime
              Duration difference = waktuPeminjaman.difference(DateTime.now());

              String formatTimestamp(Timestamp timestamp) {
                DateTime dateTime = timestamp.toDate();
                DateFormat formatter = DateFormat.yMMMMd('id_ID');
                String formattedDate = formatter.format(dateTime);
                return formattedDate;
              }

              pembayaranViewModel.pembayaranList = pembayaranViewModel
                  .pembayaranList
                  .where(
                      (pembayaranModel) => pembayaranModel.proyekId == model.id)
                  .toList();

              return MaterialApp(
                title: 'Detail Peminjaman',
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  appBar: AppBar(
                    title: Text('Detail Peminjaman'),
                  ),
                  backgroundColor: Color(0xfff5f5f5),
                  body: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(children: [
                                //content 2
                                Container(
                                  color: const Color(0xFFA1E3D8),
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        "Progress Pelunasan",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              flex: 5,
                                              child: CustomProgressBar(
                                                width: 400,
                                                height: 10,
                                                value: model
                                                        .banyakCicilanLunas! /
                                                    model.periodePembayaran!,
                                                backgroundColor: Colors.white,
                                                foregroundColor:
                                                    Color(0xff069A8E),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: Text(
                                                  "${model.banyakCicilanLunas}/${model.periodePembayaran}"),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Rp${NumberFormat('#,###', 'id_ID').format(model.jumlahDibayar)},-",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                  " / Rp${NumberFormat('#,###', 'id_ID').format(model.jumlahPinjaman)},-"),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                //end content 2
                                SizedBox(
                                  height: 40,
                                ),

                                Container(
                                  padding: const EdgeInsets.all(30),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    color: Color(0xffffffff),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                  '${model.namaProyek}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff005555),
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  '${model.deskripsiProyek}',
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
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Dana yang Dipinjam'),
                                              Text(
                                                  'Rp${NumberFormat("#,###", "id_ID").format(model.jumlahPinjaman)},-',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Bunga yang Dikenai'),
                                              Text(
                                                  'Rp${NumberFormat("#,###", "id_ID").format(model.jumlahPinjaman! * (model.periodePembayaran! / 100))},- (${model.periodePembayaran}%)',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Total Utang'),
                                              Text(
                                                  'Rp${NumberFormat("#,###", "id_ID").format((model.jumlahPinjaman! * (1 + (model.periodePembayaran! / 100))))},-',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(
                                              height: 20,
                                              child: Divider(
                                                color: Colors.black,
                                              )),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Tanggal Peminjaman'),
                                              Text(
                                                  formatTimestamp(
                                                      model.waktuPeminjaman!),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  'Tenggat Cicilan Berikutnya'),
                                              Text(
                                                  DateFormat.yMMMMd('id_ID')
                                                      .format(model
                                                          .waktuPeminjaman!
                                                          .toDate()
                                                          .add(Duration(
                                                              days: 30))),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Tenggat Pelunasan'),
                                              Text(
                                                  formatTimestamp(
                                                      model.tenggatPelunasan!),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Sisa Waktu'),
                                              Text(
                                                  '${(model.tenggatPelunasan!.toDate().difference(model.waktuPeminjaman!.toDate()).inDays / 30).floor()} bulan ${model.tenggatPelunasan!.toDate().difference(model.waktuPeminjaman!.toDate()).inDays % 30} hari',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            height: 50,
                                            color: Color(0xfff5f5f5),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    final CollectionReference
                                                        usersCollection =
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'users');
                                                    final FirebaseAuth _auth =
                                                        FirebaseAuth.instance;
                                                    User? user =
                                                        _auth.currentUser;

                                                    DocumentSnapshot snapshot =
                                                        await usersCollection
                                                            .doc(user!.uid)
                                                            .get();

                                                    var data =
                                                        PembayaranPeminjamanModel(
                                                      proyekId: model.id,
                                                      tanggalPembayaran:
                                                          Timestamp.now(),
                                                      totalPembayaran: model
                                                              .jumlahPinjaman! ~/
                                                          model
                                                              .periodePembayaran!,
                                                    );

                                                    if (snapshot.get('saldo') >
                                                        data.totalPembayaran) {
                                                      pembayaranViewModel
                                                          .newPembayaranPeminjaman(
                                                              data);

                                                      pembayaranViewModel
                                                          .pembayaranList
                                                          .add(data);

                                                      model
                                                          .jumlahDibayar = model
                                                              .jumlahDibayar! +
                                                          pembayaranViewModel
                                                              .pembayaranList[
                                                                  pembayaranViewModel
                                                                          .pembayaranList
                                                                          .length -
                                                                      1]
                                                              .totalPembayaran!;

                                                      pinjamanViewModel
                                                          .updatePinjaman(
                                                              model);

                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  StatusPeminjamanUMKM()));
                                                    }
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(
                                                        0xff005555), // Background color
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text('Bayar Cicilan'),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Divider(
                                    color: Colors.black,
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      pembayaranViewModel.pembayaranList.length,
                                  itemBuilder: (context, index) {
                                    PembayaranPeminjamanModel
                                        modelPembayaranItem =
                                        pembayaranViewModel
                                            .pembayaranList[index];

                                    return Container(
                                      padding: const EdgeInsets.all(30),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        color: Color(0xffffffff),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Cicilan ke-${index + 1}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xff005555),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Tanggal Pembayaran'),
                                                  Text(
                                                      formatTimestamp(
                                                          modelPembayaranItem
                                                              .tanggalPembayaran!),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Jumlah Pembayaran'),
                                                  Text(
                                                      'Rp${NumberFormat("#,###", "id_ID").format(modelPembayaranItem.totalPembayaran)},-',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Sisa Utang'),
                                                  Text(
                                                      'Rp${NumberFormat("#,###", "id_ID").format(model.jumlahPinjaman! - (modelPembayaranItem.totalPembayaran! * (index + 1)))},-',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ]),
                            ),
                            Container(
                              height: 100,
                            )
                          ],
                        ),
                      ),
                      const Navigasi(),
                      NavigasiMid(),
                    ],
                  ),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
