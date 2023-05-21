// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';

// void main() {
//   runApp(const UsulanPeminjamanKonfirmasi());
// }

// class UsulanPeminjamanKonfirmasi extends StatefulWidget {
//   const UsulanPeminjamanKonfirmasi({Key? key}) : super(key: key);
//   @override
//   UsulanPeminjamanKonfirmasiState createState() {
//     return UsulanPeminjamanKonfirmasiState();
//   }
// }

// class UsulanPeminjamanKonfirmasiState extends State<UsulanPeminjamanKonfirmasi> {
//   final textEditControllerJumlahPinjaman = TextEditingController();
//   final textEditControllerNamaProyek = TextEditingController();
//   final textEditControllerDeskripsiProyek = TextEditingController();

  
//   final textEditControllerPassword = TextEditingController();

//   double _jumlahPinjaman = 0;
//   // double cicilan = 0;
//   int _cicilan = 0;
//   String _cicilanRp = 'Rp0';
//   final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

//   String dropdownValue = '3 bulan';

//   double _nominalPinjaman = 0;
//   String _periodePembayaran = "";
//   double _cicilanPerbulan = 0;
//   String _namaProyek = "";
//   String _deskripsiProyek = "";
  
//   void hitungCicilan() {
//     String numericJumlahPinjaman = textEditControllerJumlahPinjaman.text.replaceAll(RegExp(r'[^0-9]'), '');
//     _jumlahPinjaman = double.tryParse(numericJumlahPinjaman) ?? 0.0;
//     double periodePembayaran = double.parse(dropdownValue.split(' ')[0]);
//     double cicilan = _jumlahPinjaman / periodePembayaran;
//     _cicilan = cicilan.toInt();
//     _cicilanRp = currencyFormatter.format(_cicilan);
//   }
  
//   @override
//   void dispose() {
//     textEditControllerJumlahPinjaman.dispose();
//     textEditControllerNamaProyek.dispose();
//     textEditControllerDeskripsiProyek.dispose();

//     textEditControllerPassword.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {

//     // main
//     return MaterialApp(
//       title: 'Usulan Peminjaman Page',
//       home: Scaffold(

//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
//               child: Text('Konfirmasi Peminjaman', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
//             ),
//             Container(
//               padding: EdgeInsets.all(20),
//               child: Container(
//                 padding: EdgeInsets.all(30),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                   color: Color(0xffA1E3D8)),
//                 alignment: Alignment.center,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
                    
//                     //-- MULAI DARI SINI -- //

//                     // Column(
//                     //   mainAxisAlignment: MainAxisAlignment.center,
//                     //   children: [
//                         Row(
//                           // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Container(
//                               height: 50,
//                               width: 50,
//                               decoration: BoxDecoration(
//                                 // image: DecorationImage(
//                                 //   image: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fmydramalist.com%2Fpeople%2F16137-mark-lee&psig=AOvVaw0IVo12jyaJ0g29KJbjfCUn&ust=1684761623123000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCNjRgKPAhv8CFQAAAAAdAAAAABAH'),
//                                 //   fit: BoxFit.fill,
//                                 color: Color(0xf000000),
//                                 ),
//                                 // shape: BoxShape.circle,
//                               ),
//                             // ),
//                             Container(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Text('Proyek Proyekan', style: TextStyle(fontWeight: FontWeight.bold),),
//                                   Text('Proyek Proyekan Proyek Proyekan Proyek Proyekan Proyek Proyekan Proyek Proyekan Proyek Proyekan'),
//                                 ],
//                               // ),
//                             )
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     // -- SAMPE SINI -- //




//                     // const Padding(
//                     //   padding: EdgeInsets.all(20),
//                     //   child: Text( 
//                     //     'Konfirmasi Peminjaman',
//                     //     style: TextStyle(
//                     //       fontSize: 30,
//                     //       fontWeight: FontWeight.bold,
//                     //     ),
//                     //   ), 
//                     // ),

//                     // Container(
//                     //   padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 5),
//                     //   child: Column(
//                     //     mainAxisAlignment: MainAxisAlignment.center,
//                     //     children: [
//                     //       Align(
//                     //         alignment: Alignment.centerLeft,
//                     //         child: Text('Nominal Pinjaman'),
//                     //       ),
//                     //       Form(
//                     //         autovalidateMode: AutovalidateMode.always,
//                     //         child: Container(                  
//                     //           child: TextFormField(
//                     //             controller: textEditControllerJumlahPinjaman,
//                     //             keyboardType: TextInputType.number,
//                     //             inputFormatters: [
//                     //               FilteringTextInputFormatter.digitsOnly,
//                     //               // CurrencyInputFormatter(),
//                     //             ],
//                     //             decoration: const InputDecoration(
//                     //               border: OutlineInputBorder(),
//                     //               fillColor: Colors.white,
//                     //               hintText: 'Jumlah Pinjaman (masukkan hanya angka)'
//                     //             ),
//                     //           ),
//                     //         ), 
//                     //       ),
//                     //     ],
//                     //   ),
//                     // ),
                      
//                     // Container(
//                     //   padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
//                     //   child: Column(
//                     //     mainAxisAlignment: MainAxisAlignment.center,
//                     //     children: [
//                     //       Align(
//                     //         alignment: Alignment.centerLeft,
//                     //         child: Text('Periode Pembayaran'),
//                     //       ),

//                     //       Container(
//                     //         decoration: BoxDecoration(
//                     //           borderRadius: BorderRadius.circular(5),
//                     //           color: Colors.white,
//                     //         ),
//                     //         child: DropdownButtonHideUnderline(
//                     //           child: ButtonTheme(
//                     //             alignedDropdown: true,
//                     //             child: 
//                     //             DropdownButton(
//                     //               isExpanded: true,
//                     //               value: dropdownValue,
//                     //               icon: const Icon(Icons.keyboard_arrow_down),
//                     //               items: <String>['3 bulan', '6 bulan', '9 bulan', '12 bulan']
//                     //                 .map<DropdownMenuItem<String>>((String value) {
//                     //                   return DropdownMenuItem<String>(
//                     //                     value: value,
//                     //                     child: Text(value),
//                     //                   );
//                     //                 }).toList(),
//                     //               onChanged: (String? newValue) {
//                     //                 setState(() {
//                     //                   dropdownValue = newValue!;
//                     //                   hitungCicilan();
//                     //                 });
//                     //               }
//                     //             ),
//                     //           ),
//                     //         ),
//                     //       ),
//                     //     ],
//                     //   ),
//                     // ),

//                     // Container(
//                     //   padding: EdgeInsets.only(top: 5, bottom: 10, left: 5, right: 5),
//                     //   child: Column(
//                     //     mainAxisAlignment: MainAxisAlignment.center,
//                     //     children: [
//                     //       Align(
//                     //         alignment: Alignment.centerLeft,
//                     //         child: Text('Cicilan Perbulan'),
//                     //       ),

//                     //       Container(                  
//                     //         padding: const EdgeInsets.all(15),
//                     //         height: 50,
//                     //         decoration: BoxDecoration(
//                     //           borderRadius: BorderRadius.circular(5),
//                     //           color: Colors.white,
//                     //         ),
//                     //         child: Align(
//                     //           alignment: Alignment.centerLeft,
//                     //           child: Text('$_cicilanRp', style: TextStyle(fontSize: 15),),
//                     //         ),
//                     //       ), 
//                     //     ],
//                     //   ),
//                     // )
                      
// //                   // ]
// //                 ),
// //               ),
// //             ),
            
// //             Container(
// //               padding: EdgeInsets.only(left: 20, right: 20, top: 10),
// //               child: 
// //                 SizedBox(
// //                   height: 50,
// //                   width: double.infinity,
// //                   child: ElevatedButton(
// //                     onPressed: () {
// //                       setState(() {
// //                         // plus konfirmasi screen
// //                         hitungCicilan();
// //                         _nominalPinjaman = _jumlahPinjaman;
// //                         _periodePembayaran = dropdownValue;
// //                         _cicilanPerbulan = _cicilan.toDouble();
// //                         _namaProyek = textEditControllerNamaProyek.text;
// //                         _deskripsiProyek = textEditControllerDeskripsiProyek.text;                    
// //                       });
// //                     },
// //                       child: 
// //                         const Text('Lanjutkan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
// //                   ),
// //                 )
// //               ),
             
// //             Text(
// //                 'Halo nominal pinjaman kamu $_nominalPinjaman, periode pembayaran kamu $_periodePembayaran, cicilannya $_cicilanPerbulan, proyeknya $_namaProyek, deskripsinya $_deskripsiProyek',
// //                 style: const TextStyle(
// //                   fontSize: 30, 
// //                   fontWeight: FontWeight.bold, 
// //                   color: Color.fromARGB(255, 120, 214, 13)
// //                 ),
// //             ),
            
// //           ]
// //         ),
// //       )
// //       )
// //     );
// //   }
// // }
