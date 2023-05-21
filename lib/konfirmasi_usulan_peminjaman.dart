import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const KonfirmasiUsulanPeminjaman());
}

class KonfirmasiUsulanPeminjaman extends StatefulWidget {
  const KonfirmasiUsulanPeminjaman({Key? key}) : super(key: key);
  @override
  KonfirmasiUsulanPeminjamanState createState() {
    return KonfirmasiUsulanPeminjamanState();
  }
}

class KonfirmasiUsulanPeminjamanState extends State<KonfirmasiUsulanPeminjaman> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Konfirmasi Usulan Peminjaman Page',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // container judul //
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
                child: Text('Konfirmasi Peminjaman', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              ),
              
              // container utama //
              Container(
                padding: EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Color(0xffA1e3d8),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xff00000),
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Proyek Proyekan', style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('datadatadatadatadatadatadatadatadatadatadatadata ', overflow: TextOverflow.clip,)
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      )
      
    );
  }
}