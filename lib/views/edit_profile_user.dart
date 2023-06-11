import 'dart:io';
import 'package:flutter/material.dart';
import 'package:homepage/viewmodels/profile_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'profile_user.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ktpController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileViewModel>(
      create: (_) => ProfileViewModel(),
      child: Builder(builder: (context) {
        final profilViewModel = Provider.of<ProfileViewModel>(context);

        return FutureBuilder(
          future: Future.wait([profilViewModel.getCurrentUser()]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              String? nama = profilViewModel.currentUser?.nama;
              String? ktp = profilViewModel.currentUser?.ktp;
              String? email = profilViewModel.currentUser?.email;

              nameController.text = nama ?? '';
              ktpController.text = ktp ?? '';

              void onSaveButtonClicked() {
                final profileViewModel =
                    Provider.of<ProfileViewModel>(context, listen: false);
                final String name = nameController.text;
                final String ktp = ktpController.text;

                profileViewModel.updateProfile(name, ktp);
              }

              return Scaffold(
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 16),
                            const Text(
                              'Edit Profil',
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
                                    'Nama',
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
                                      controller: nameController,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'No KTP',
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
                                      controller: ktpController,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Email',
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
                                    child: Text(
                                      '$email',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                onSaveButtonClicked();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ProfilePage()));
                              },
                              child: const Text('Simpan'),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 100,
                            )
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
          },
        );
      }),
    );
  }
}
