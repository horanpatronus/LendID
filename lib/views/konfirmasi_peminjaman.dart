import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const UsulanPeminjamanKonfirmasi());
}

class UsulanPeminjamanKonfirmasi extends StatefulWidget {
  const UsulanPeminjamanKonfirmasi({Key? key}) : super(key: key);
  @override
  UsulanPeminjamanKonfirmasiState createState() {
    return UsulanPeminjamanKonfirmasiState();
  }
}

class UsulanPeminjamanKonfirmasiState extends State<UsulanPeminjamanKonfirmasi> {
  final textEditControllerJumlahPinjaman = TextEditingController();
  final textEditControllerNamaProyek = TextEditingController();
  final textEditControllerDeskripsiProyek = TextEditingController();

  
  final textEditControllerPassword = TextEditingController();

  double _jumlahPinjaman = 0;
  // double cicilan = 0;
  int _cicilan = 0;
  String _cicilanRp = 'Rp0';
  final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

  String dropdownValue = '3 bulan';

  double _nominalPinjaman = 0;
  String _periodePembayaran = "";
  double _cicilanPerbulan = 0;
  String _namaProyek = "";
  String _deskripsiProyek = "";
  
  void hitungCicilan() {
    String numericJumlahPinjaman = textEditControllerJumlahPinjaman.text.replaceAll(RegExp(r'[^0-9]'), '');
    _jumlahPinjaman = double.tryParse(numericJumlahPinjaman) ?? 0.0;
    double periodePembayaran = double.parse(dropdownValue.split(' ')[0]);
    double cicilan = _jumlahPinjaman / periodePembayaran;
    _cicilan = cicilan.toInt();
    _cicilanRp = currencyFormatter.format(_cicilan);
  }
  
  @override
  void dispose() {
    textEditControllerJumlahPinjaman.dispose();
    textEditControllerNamaProyek.dispose();
    textEditControllerDeskripsiProyek.dispose();

    textEditControllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // main
    return MaterialApp(
      title: 'Usulan Peminjaman Page',
      home: Scaffold(

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
              child: const Text('Konfirmasi Peminjaman', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Color(0xffA1E3D8)),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            // image: DecorationImage(
                            //   image: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fmydramalist.com%2Fpeople%2F16137-mark-lee&psig=AOvVaw0IVo12jyaJ0g29KJbjfCUn&ust=1684761623123000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCNjRgKPAhv8CFQAAAAAdAAAAABAH'),
                            //   fit: BoxFit.fill,
                            color: Color(0x0f000000),
                          ),
                          // shape: BoxShape.circle,
                        ),
                        // ),
                        Container(
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Proyek Proyekan', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('Proyek Proyekan Proyek Proyekan Proyek Proyekan Proyek Proyekan Proyek Proyekan Proyek Proyekan', overflow: TextOverflow.clip,),
                            ],
                          )
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: 
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    // plus konfirmasi screen
                                    hitungCicilan();
                                    _nominalPinjaman = _jumlahPinjaman;
                                    _periodePembayaran = dropdownValue;
                                    _cicilanPerbulan = _cicilan.toDouble();
                                    _namaProyek = textEditControllerNamaProyek.text;
                                    _deskripsiProyek = textEditControllerDeskripsiProyek.text;                    
                                  });
                                },
                                  child: 
                                    const Text('Lanjutkan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ),
                            )
                          ),
                      ],
                    ),
                  ]
                ),
              )
            ),
          ]
        ),
      ),
      ),
    );
  }
}
