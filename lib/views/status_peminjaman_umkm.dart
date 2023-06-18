import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homepage/models/pinjaman_umkm_model.dart';
import 'package:homepage/viewmodels/pinjaman_umkm_viewmodel.dart';
import 'package:homepage/views/detail_peminjaman_umkm.dart';
import 'package:homepage/views/history_umkm.dart';

import 'package:homepage/views/history_umkm.dart';

import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

class StatusPeminjamanUMKM extends StatefulWidget {
  const StatusPeminjamanUMKM({Key? key}) : super(key: key);
  @override
  StatusPeminjamanUMKMState createState() {
    return StatusPeminjamanUMKMState();
  }
}

class StatusPeminjamanUMKMState extends State<StatusPeminjamanUMKM> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PinjamanUmkmViewModel>(
        create: (_) => PinjamanUmkmViewModel(),
        child: Builder(builder: (context) {
          final pinjamanViewModel = Provider.of<PinjamanUmkmViewModel>(context);

          return FutureBuilder(
            future: Future.wait([pinjamanViewModel.getPinjamanUmkm()]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<PinjamanUmkmModel> pinjamanMenungguList = pinjamanViewModel
                    .pinjamanList
                    .where((model) => model.status == 'Menunggu Konfirmasi')
                    .toList();

                pinjamanViewModel.pinjamanList = pinjamanViewModel.pinjamanList
                    .where((model) => model.status != 'Menunggu Konfirmasi')
                    .toList();

                int totalPeminjamanTotal = pinjamanViewModel.totalPeminjaman;
                int jumlahDanaTotal = pinjamanViewModel.jumlahPinjaman.toInt();
                int jumlahUtangTotal = pinjamanViewModel.jumlahDibayar;
                int sisaUtangTotal = pinjamanViewModel.sisaHutang.toInt();

                String formatTimestamp(Timestamp timestamp) {
                  DateTime dateTime = timestamp.toDate();
                  DateFormat formatter = DateFormat.yMMMMd('id_ID');
                  String formattedDate = formatter.format(dateTime);
                  return formattedDate;
                }

                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: Color(0xff005555),
                        title: Text('Status Peminjaman'),
                        actions: [
                          IconButton(
                            icon: Icon(Icons.history),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(

                                  //pergi ke halaman
                                  builder: (context) => const HistoryUMKM(),

                                ),
                              );
                            },
                          ),
                          Container(
                            width: 20,
                          ),
                        ],
                        bottom: const TabBar(tabs: [
                          Tab(text: "Diterima"),
                          Tab(text: "Diproses")
                        ]),
                      ),
                      backgroundColor: Color(0xfff5f5f5),
                      body: Stack(
                        children: [
                          TabBarView(children: [
                            // bar peminjaman diterima //
                            Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),

                                  // container utama
                                  Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 0.5,
                                            blurRadius: 10,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(30),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          color: Color(0xffffffff),
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'Ringkasan Peminjaman Berjalan',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff005555),
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.calculate,
                                                  size: 30,
                                                  color: Color(0xff005555),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Total Peminjaman Berjalan',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff005555),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      Text(
                                                        '$totalPeminjamanTotal Peminjaman',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff0055555),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.credit_card,
                                                  size: 30,
                                                  color: Color(0xff005555),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Jumlah Dana yang Dipinjam',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff005555),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      Text(
                                                        'Rp${NumberFormat("#,###", "id_ID").format(jumlahDanaTotal)},-',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff0055555),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.monetization_on,
                                                  size: 30,
                                                  color: Color(0xff005555),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Jumlah Utang Terbayar',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff005555),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      Text(
                                                        'Rp${NumberFormat("#,###", "id_ID").format(jumlahUtangTotal)},-',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff0055555),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.attach_money,
                                                  size: 30,
                                                  color: Color(0xff005555),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Sisa Utang',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff005555),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      Text(
                                                        'Rp${NumberFormat("#,###", "id_ID").format(sisaUtangTotal)},-',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff0055555),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: SizedBox(
                                      height: 10,
                                      child: Divider(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  // --- ini harusnya pake listview builder --- //
                                  Expanded(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: pinjamanViewModel
                                            .pinjamanList?.length,
                                        itemBuilder: (context, index) {
                                          PinjamanUmkmModel model =
                                              pinjamanViewModel
                                                  .pinjamanList![index];
                                          return Container(
                                              padding: const EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    spreadRadius: 0.5,
                                                    blurRadius: 10,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(30),
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: Color(0xffffffff),
                                                ),
                                                child: Column(
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 50,
                                                          width: 50,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Color(
                                                                0xff00000),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                '${model.namaProyek}',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color(
                                                                      0xff005555),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                              Text(
                                                                '${model.deskripsiProyek}',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                      0xff0055555),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                                overflow:
                                                                    TextOverflow
                                                                        .clip,
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
                                                    Text(
                                                      'Sisa Utang: Rp${NumberFormat("#,###", "id_ID").format((model.jumlahPinjaman! - model.jumlahDibayar!) + model.jumlahPinjaman! * (model.periodePembayaran! / 100))},-',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                      child: Divider(
                                                        color: Colors.black,
                                                      ),
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
                                                            Text(
                                                                'Dana yang Dipinjam'),
                                                            Text(
                                                                'Rp${NumberFormat("#,###", "id_ID").format(model.jumlahPinjaman)},-',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
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
                                                            Text(
                                                                'Bunga yang Dikenai'),
                                                            Text(
                                                                'Rp${NumberFormat("#,###", "id_ID").format(model.jumlahPinjaman! * (model.periodePembayaran! / 100))},- (${model.periodePembayaran}%)',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
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
                                                            Text('Total Utang'),
                                                            Text(
                                                                'Rp${NumberFormat("#,###", "id_ID").format((model.jumlahPinjaman! * (1 + (model.periodePembayaran! / 100))))},-',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
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
                                                            Text(
                                                                'Progress Cicilan'),
                                                            Text(
                                                                '${model.banyakCicilanLunas} dari ${model.periodePembayaran} kali',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
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
                                                            Text(
                                                                'Tanggal Peminjaman'),
                                                            Text(
                                                                formatTimestamp(
                                                                    model
                                                                        .waktuPeminjaman!),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
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
                                                            Text(
                                                                'Tanggal Pelunasan'),
                                                            Text(
                                                                formatTimestamp(
                                                                    model
                                                                        .tenggatPelunasan!),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
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
                                                            Text('Sisa Waktu'),
                                                            Text(
                                                                '${(model.tenggatPelunasan!.toDate().difference(model.waktuPeminjaman!.toDate()).inDays / 30).floor()} bulan ${model.tenggatPelunasan!.toDate().difference(model.waktuPeminjaman!.toDate()).inDays % 30} hari',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              height: 50,
                                                              color: Color(
                                                                  0xfff5f5f5),
                                                              child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          0),
                                                                  child:
                                                                      ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          //pergi ke halaman
                                                                          builder: (context) =>
                                                                              DetailPeminjamanUMKM(model: model),
                                                                        ),
                                                                      );
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      primary:
                                                                          Color(
                                                                              0xff005555), // Background color
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                            'Lihat Detail'),
                                                                      ],
                                                                    ),
                                                                  )),
                                                            ),
                                                            Container(
                                                              height: 50,
                                                              color: Color(
                                                                  0xfff5f5f5),
                                                              child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          0),
                                                                  child:
                                                                      ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          //pergi ke halaman
                                                                          builder: (context) =>
                                                                              DetailPeminjamanUMKM(model: model),
                                                                        ),
                                                                      );
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      primary:
                                                                          Color(
                                                                              0xff005555), // Background color
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                            'Bayar Utang'),
                                                                      ],
                                                                    ),
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ));
                                        }),
                                  ),

                                  Container(
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),

                            // bar peminjaman diproses
                            ListView.builder(
                              itemCount: pinjamanMenungguList.length,
                              itemBuilder: (context, index) {
                                PinjamanUmkmModel modelPinjamanMenunggu =
                                    pinjamanMenungguList[index];

                                return Center(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                  spreadRadius: 0.5,
                                                  blurRadius: 10,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Container(
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
                                                      Container(
                                                        height: 50,
                                                        width: 50,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xff00000),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${modelPinjamanMenunggu.namaProyek}',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xff005555),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                            ),
                                                            Text(
                                                              '${modelPinjamanMenunggu.deskripsiProyek}',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: Color(
                                                                    0xff0055555),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
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
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              'Dana yang Dipinjaman'),
                                                          Text(
                                                              'Rp${NumberFormat("#,###", "id_ID").format(modelPinjamanMenunggu.jumlahPinjaman)},-',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
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
                                                          Text(
                                                              'Bunga yang Dikenai'),
                                                          Text(
                                                              'Rp${NumberFormat("#,###", "id_ID").format(modelPinjamanMenunggu.jumlahPinjaman! * (modelPinjamanMenunggu.periodePembayaran! / 100))},- (${modelPinjamanMenunggu.periodePembayaran}%)',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
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
                                                          Text('Total Utang'),
                                                          Text(
                                                              'Rp${NumberFormat("#,###", "id_ID").format((modelPinjamanMenunggu.jumlahPinjaman! * (1 + (modelPinjamanMenunggu.periodePembayaran! / 100))))},-',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
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
                                                          Text('Biaya Cicilan'),
                                                          Text(
                                                              'Rp${NumberFormat("#,###", "id_ID").format((modelPinjamanMenunggu.jumlahPinjaman! * (1 + (modelPinjamanMenunggu.periodePembayaran! / 100))) / modelPinjamanMenunggu.periodePembayaran!)},-',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
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
                                                          Text(
                                                              'Banyaknya Cicilan'),
                                                          Text(
                                                              '${modelPinjamanMenunggu.periodePembayaran} kali',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
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
                                                          Text(
                                                              'Tanggal Peminjaman'),
                                                          Text(
                                                              formatTimestamp(
                                                                  modelPinjamanMenunggu
                                                                      .waktuPeminjaman!),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                        child: Divider(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text('Status'),
                                                          Text(
                                                              '${modelPinjamanMenunggu.status}',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )),
                                        Container(height: 100)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ]),
                          const Navigasi(),
                          NavigasiMid(),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          );
        }));
  }
}
