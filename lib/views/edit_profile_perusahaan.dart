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
  String npwp = '31231312311321232123';
  int selectedIncome = 1;

  @override
  void initState() {
    super.initState();
    companyNameController.text = companyName;
    companyAddressController.text = companyAddress;
    npwpController.text = npwp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    'Edit Profil Perusahaan',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('page3.png'),
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
                            items: const [
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
