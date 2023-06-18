import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homepage/models/pinjaman_umkm_model.dart';
import 'package:homepage/viewmodels/pinjaman_umkm_viewmodel.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';
import 'package:intl/intl.dart';

import 'konfirmasi_usulan_peminjaman.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    final double value = double.parse(newValue.text);
    final String formattedValue = currencyFormatter.format(value);

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}

class UsulanPeminjaman extends StatefulWidget {
  const UsulanPeminjaman({Key? key}) : super(key: key);

  @override
  UsulanPeminjamanState createState() => UsulanPeminjamanState();
}

class UsulanPeminjamanState extends State<UsulanPeminjaman> {
  final PinjamanUmkmViewModel _pinjamanViewModel = PinjamanUmkmViewModel();
  final textEditControllerJumlahPinjaman = TextEditingController();
  final textEditControllerNamaProyek = TextEditingController();
  final textEditControllerDeskripsiProyek = TextEditingController();

  double _jumlahPinjaman = 0;
  // double cicilan = 0;
  int _cicilan = 0;
  String _cicilanRp = 'Rp0';
  final currencyFormatter =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

  String dropdownValue = '3 bulan';

  double _nominalPinjaman = 0;
  String _periodePembayaran = "";
  double _cicilanPerbulan = 0;
  String _namaProyek = "";
  String _deskripsiProyek = "";

  void hitungCicilan() {
    String numericJumlahPinjaman =
        textEditControllerJumlahPinjaman.text.replaceAll(RegExp(r'[^0-9]'), '');
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
    super.dispose();
  }

  void newUsulan() {
    PinjamanUmkmModel pinjaman = PinjamanUmkmModel(
      deskripsiProyek: textEditControllerDeskripsiProyek.text,
      jumlahPinjaman: int.tryParse(textEditControllerJumlahPinjaman.text
              .replaceAll(RegExp(r'[^0-9]'), '')) ??
          0,
      namaProyek: textEditControllerNamaProyek.text,
      periodePembayaran: int.parse(dropdownValue.split(' ')[0]),
      status: 'Menunggu Pendanaan',
      userId: '',
      waktuPengajuan: Timestamp.fromDate(DateTime.now()),
      waktuPeminjaman:
          Timestamp.fromDate(DateTime.now().add(const Duration(days: 90))),
    );

    _pinjamanViewModel.handleUsulanPeminjamanData(pinjaman);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => KonfirmasiUsulanPeminjaman(
          pinjamanViewModel: _pinjamanViewModel,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // main
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Usulan Peminjaman Page',
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(
                      context); // Fungsi ini akan mempop halaman saat tombol kembali ditekan
                },
              ),
              title: Text('Usulan Peminjaman'),
              backgroundColor: Color(0xff005555),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            color: Color(0xffA1E3D8)),
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'Usulan Peminjaman',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 10, top: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Nominal Pinjaman'),
                                    ),
                                    Form(
                                      autovalidateMode: AutovalidateMode.always,
                                      child: TextFormField(
                                        controller:
                                            textEditControllerJumlahPinjaman,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          CurrencyInputFormatter(),
                                        ],
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            fillColor: Colors.white,
                                            hintText:
                                                'Jumlah Pinjaman (masukkan hanya angka)'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 5, bottom: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Periode Pembayaran'),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton(
                                              isExpanded: true,
                                              value: dropdownValue,
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              items: <String>[
                                                '3 bulan',
                                                '6 bulan',
                                                '9 bulan',
                                                '12 bulan'
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  dropdownValue = newValue!;
                                                  hitungCicilan();
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 10, left: 5, right: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Cicilan Perbulan'),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(15),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          _cicilanRp,
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            color: Color(0xffA1E3D8)),
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'Deskripsi Perusahaan',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 5, bottom: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Nama Proyek'),
                                    ),
                                    Form(
                                      autovalidateMode: AutovalidateMode.always,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        child: TextFormField(
                                          controller:
                                              textEditControllerNamaProyek,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Nama Proyek'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 5, bottom: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Deskripsi Proyek'),
                                    ),
                                    Form(
                                      autovalidateMode: AutovalidateMode.always,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        child: TextFormField(
                                          controller:
                                              textEditControllerDeskripsiProyek,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Deskripsi Proyek',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              newUsulan();
                            },
                            child: const Text(
                              'Lanjutkan',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    Container(
                      height: 100,
                    ),
                  ]),
                ),
                Navigasi(),
                NavigasiMid(),
              ],
            )));
  }
}
