import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'profile_user.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

class EditProfilePerusahaan extends StatefulWidget {
  const EditProfilePerusahaan({Key? key}) : super(key: key);

  @override
  _EditProfilePerusahaanState createState() => _EditProfilePerusahaanState();
}

class _EditProfilePerusahaanState extends State<EditProfilePerusahaan> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController npwpController = TextEditingController();
  String companyName = 'Company XYZ';
  String companyAddress = 'Jl. Raya ABC No. 123';
  String npwp = '';
  int selectedIncome = 1;
  File? npwpDocument;

  @override
  void initState() {
    super.initState();
    companyNameController.text = companyName;
    companyAddressController.text = companyAddress;
    npwpController.text = npwp;
  }

  Future<void> selectNPWPDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf'
      ], // Ganti dengan ekstensi yang diizinkan untuk file NPWP
    );

    if (result != null) {
      setState(() {
        npwpDocument = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil Perusahaan'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Judul Profil Perusahaan',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Nama Perusahaan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: companyNameController,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Alamat Perusahaan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: companyAddressController,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'NPWP Perusahaan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: npwpController,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Penghasilan Perbulan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButton<int>(
                            value: selectedIncome,
                            onChanged: (value) {
                              setState(() {
                                selectedIncome = value!;
                              });
                            },
                            items: [
                              DropdownMenuItem<int>(
                                value: 1,
                                child: const Text('< 100 Juta'),
                              ),
                              DropdownMenuItem<int>(
                                value: 2,
                                child: const Text('100 - 500 Juta'),
                              ),
                              DropdownMenuItem<int>(
                                value: 3,
                                child: const Text('> 500 Juta'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Dokumen NPWP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Text(
                                npwpDocument != null
                                    ? 'File terpilih: ${npwpDocument!.path}'
                                    : 'Belum diunggah',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: null, // Nonaktifkan fungsi onPressed
                                style: ElevatedButton.styleFrom(
                                  primary: Colors
                                      .grey, // Ubah warna tombol menjadi abu-abu
                                  onPrimary: Colors
                                      .black, // Ubah warna teks tombol menjadi hitam
                                ),
                                child: const Text('Unggah Dokumen NPWP'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ProfilePage()),
                      );
                    },
                    child: const Text('Simpan'),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
          const Navigasi(),
          const NavigasiMid(),
        ],
      ),
    );
  }
}
