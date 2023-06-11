import 'package:flutter/material.dart';
import 'package:homepage/views/history_investor.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

class StatusInvestor extends StatefulWidget {
  const StatusInvestor({Key? key}) : super(key: key);

  @override
  _StatusInvestorState createState() => _StatusInvestorState();
}

class _StatusInvestorState extends State<StatusInvestor>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _namaProyek = "Nama Proyek";
  String _deskripsiProyek =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  String _danaDiberikan = "Rp2.000.000,-";
  String _estDidapatkan = "Rp100.000,-";
  String _tglHasil = "5 Maret 2023";
  String _statusDiproses = "Terkonfirmasi Admin";
  String _statusDiterima = "Proses Pendanaan";
  int _totalInvestBerjalan = 5;
  String _totalDanaDiberikan = "Rp10.0000.000";
  String _totalEstimasi = "Rp1.000.000";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _confirmInvest() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 250,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Color(0xff005555),
                  size: 150,
                ),
                Text(
                  "Investasi Terkonfirmasi",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Terima kasih sudah investasi!",
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
  }

  void _cancelInvest() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 250,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.warning,
                  color: Colors.red,
                  size: 150,
                ),
                Text(
                  "Batalkan Investasi?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Anda yakin ingin membatalkan investasi?",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Menampilkan dialog konfirmasi pembatalan investasi
                _showCancelConfirmationDialog();
              },
              child: Text(
                'Ya',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Tidak',
                style: TextStyle(color: Color(0xff005555)),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showCancelConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 250,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Color(0xff005555),
                  size: 150,
                ),
                Text(
                  "Investasi Dibatalkan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Investasi berhasil dibatalkan!",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            DefaultTabController(
              length: 2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status Investasi",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //pergi ke halaman akun
                                  builder: (context) => HistoryInvestor(),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.history,
                              // color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          color: Color(0xff069A8E),
                          borderRadius: BorderRadius.circular(300)),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: TabBar(
                          unselectedLabelColor: Colors.white,
                          labelColor: Colors.black,
                          // indicatorColor: Colors.amber,
                          // indicatorWeight: 2,
                          indicator: BoxDecoration(
                            color: Color(0xffF7FF93),
                            borderRadius: BorderRadius.circular(300),
                            // border: Border.
                          ),

                          tabs: [
                            Tab(text: "Diproses"),
                            Tab(text: "Diterima"),
                          ],
                          controller: _tabController,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: Color(0xffA1E3D8),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(0,
                                          5), // Mengatur posisi bayangan (x, y)
                                    ),
                                  ],
                                ),
                                width: double.maxFinite,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Image(
                                              image: NetworkImage(
                                                "https://picsum.photos/id/1023/100/100",
                                              ),
                                              fit: BoxFit.cover,
                                              height: 50,
                                              width: 50,
                                            ),
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  _namaProyek,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  _deskripsiProyek,
                                                  // style: TextStyle(fontSize: 10),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: true,
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Dana yang diberikan"),
                                        Text(
                                          _danaDiberikan,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                                    Container(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Est. hasil yang didapatkan"),
                                        Text(
                                          _estDidapatkan,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                                    Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Tgl. mendapatkan hasil"),
                                            Text(
                                              _tglHasil,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )),
                                    Divider(
                                      // Garis horizontal
                                      color: Colors.black,
                                      thickness: 1,
                                      // indent: 10,
                                      // endIndent: 10,
                                    ),
                                    Container(
                                      // margin: EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Status"),
                                          Text(
                                            _statusDiproses,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      // Garis horizontal
                                      color: Colors.black,
                                      thickness: 1,
                                      // indent: 10,
                                      // endIndent: 10,
                                    ),
                                    if (_statusDiproses ==
                                        "Terkonfirmasi Admin")
                                      Container(
                                        padding: EdgeInsets.all(30),
                                        // color: Colors.amber,
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Text(
                                                "Konfirmasi Investasi?",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            Container(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: _confirmInvest,
                                                  child: Icon(
                                                    Icons.check_circle,
                                                    color: Color(0xff005555),
                                                    size:
                                                        40, // Atur ukuran ikon menjadi lebih besar (misalnya 40)
                                                  ),
                                                ),
                                                Container(
                                                  width: 40,
                                                ),
                                                GestureDetector(
                                                  onTap: _cancelInvest,
                                                  child: Icon(
                                                    Icons.cancel_rounded,
                                                    color: Color(0xff005555),
                                                    size:
                                                        40, // Atur ukuran ikon menjadi lebih besar (misalnya 30)
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                          //isi kedua / diterima
                          Column(
                            children: [
                              Container(
                                height: 200,
                                margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: Color(0xff069A8E),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(0,
                                          5), // Mengatur posisi bayangan (x, y)
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        "Ringkasan Investasi yang Berjalan",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      // Garis horizontal
                                      color: Colors.black,
                                      thickness: 1,
                                      // indent: 10,
                                      // endIndent: 10,
                                    ),
                                    Container(
                                      // color: Colors.amber,
                                      height: 50,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Icon(
                                              Icons
                                                  .assignment_turned_in_outlined,
                                              size: 30,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  "Total Investasi yang Sedang Berjalan"),
                                              Text(
                                                _totalInvestBerjalan.toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // color: Colors.amber,
                                      height: 50,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Icon(
                                              Icons.request_quote_outlined,
                                              size: 30,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  "Jumlah Dana yang Diberikan"),
                                              Text(
                                                _totalDanaDiberikan.toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // color: Colors.amber,
                                      height: 50,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Icon(
                                              Icons.stacked_line_chart,
                                              size: 30,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Estimasi Hasil"),
                                              Text(
                                                _totalEstimasi.toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Color(0xffA1E3D8),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 3,
                                            offset: Offset(0,
                                                5), // Mengatur posisi bayangan (x, y)
                                          ),
                                        ],
                                      ),
                                      width: double.maxFinite,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Image(
                                                    image: NetworkImage(
                                                      "https://picsum.photos/id/1023/100/100",
                                                    ),
                                                    fit: BoxFit.cover,
                                                    height: 50,
                                                    width: 50,
                                                  ),
                                                ),
                                                Container(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        _namaProyek,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        _deskripsiProyek,
                                                        // style: TextStyle(fontSize: 10),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        softWrap: true,
                                                        textAlign:
                                                            TextAlign.justify,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Dana yang diberikan"),
                                              Text(
                                                _danaDiberikan,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )),
                                          Container(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  "Est. hasil yang didapatkan"),
                                              Text(
                                                _estDidapatkan,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )),
                                          Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "Tgl. mendapatkan hasil"),
                                                  Text(
                                                    _tglHasil,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            decoration: BoxDecoration(
                                              color: Color(0xff069A8E),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        top: 5, left: 5),
                                                    child: Text(
                                                      "Status",
                                                    )),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 20),
                                                  child: Center(
                                                    child: Text(
                                                      _statusDiterima,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                height: 50,
                              ),
                            ],
                          )
                        ],
                        controller: _tabController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Navigasi(),
            NavigasiMid(),
          ],
        ),
      ),
    );
  }
}
