import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:homepage/viewmodels/profile_viewmodel.dart';
import 'package:provider/provider.dart';
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

  int penghasilanPerusahaan = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileViewModel>(
      create: (_) => ProfileViewModel(),
      child: Builder(builder: (context) {
        final profileViewModel = Provider.of<ProfileViewModel>(context);

        return FutureBuilder(
          future: Future.wait([profileViewModel.getCurrentUser()]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              Map<String, dynamic>? perusahaan =
                  profileViewModel.currentUser?.perusahaan;
              String nama = perusahaan?['nama'] ?? '';
              String alamat = perusahaan?['alamat'] ?? '';
              String npwp = perusahaan?['npwp'] ?? '';

              companyNameController.text = nama;
              companyAddressController.text = alamat;
              npwpController.text = npwp;

              void onSaveButtonClicked() {
                final profileViewModel =
                    Provider.of<ProfileViewModel>(context, listen: false);
                final String nama = companyNameController.text;
                final String alamat = companyAddressController.text;
                final String npwp = npwpController.text;

                profileViewModel.updateCompanyProfile(
                    nama, alamat, npwp, penghasilanPerusahaan);
              }

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
                                        value: penghasilanPerusahaan,
                                        onChanged: (value) {
                                          setState(() {
                                            penghasilanPerusahaan = value!;
                                          });
                                        },
                                        items: const [
                                          DropdownMenuItem<int>(
                                            value: 0,
                                            child: Text(
                                                '-- tidak/belum di set --'),
                                          ),
                                          DropdownMenuItem<int>(
                                            value: 1,
                                            child: Text('< 100 Juta'),
                                          ),
                                          DropdownMenuItem<int>(
                                            value: 2,
                                            child: Text('100 - 500 Juta'),
                                          ),
                                          DropdownMenuItem<int>(
                                            value: 3,
                                            child: Text('> 500 Juta'),
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
                                  onSaveButtonClicked();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) => ProfilePage()),
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
                ),
              );
            }
          },
        );
      }),
    );
  }
}
