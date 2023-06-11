import 'package:flutter/material.dart';
import 'package:homepage/viewmodels/profile_viewmodel.dart';
import 'package:homepage/views/edit_profile_perusahaan.dart';
import 'package:provider/provider.dart';
import 'edit_profile_user.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
                  String? role = profilViewModel.currentUser?.role;

                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Profile'),
                      backgroundColor: Color(0xFF005555),
                      bottom: role == 'UMKM'
                          ? TabBar(
                              controller: _tabController,
                              tabs: const [
                                Tab(text: 'User'),
                                Tab(text: 'Perusahaan'),
                              ],
                            )
                          : null,
                    ),
                    body: Stack(
                      children: [
                        DefaultTabController(
                          length: role == 'UMKM' ? 2 : 0,
                          child: NestedScrollView(
                            headerSliverBuilder: (context, innerBoxIsScrolled) {
                              return [
                                SliverToBoxAdapter(
                                  child: Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 16),
                                        const CircleAvatar(
                                          radius: 80,
                                          backgroundImage:
                                              AssetImage('page3.png'),
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          nama ?? '',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ];
                            },
                            body: role == 'Investor'
                                ? buildUserTab()
                                : TabBarView(
                                    controller: _tabController,
                                    children: [
                                      buildUserTab(),
                                      buildCompanyTab(),
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
              });
        }));
  }

  Widget buildUserTab() {
    return Consumer<ProfileViewModel>(builder: (context, profileViewModel, _) {
      String? nama = profileViewModel.currentUser?.nama;
      String? ktp = profileViewModel.currentUser?.ktp;
      String? email = profileViewModel.currentUser?.email;
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: const Text(
                            'Nama:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text('$nama'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: const Text(
                            'No KTP:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text('$ktp'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: const Text(
                            'Email:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text('$email'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const EditProfilePage()),
                );
              },
              child: const Text('Edit Akun'),
            ),
          ],
        ),
      );
    });
  }

  // widget tab untuk perusahaan
  Widget buildCompanyTab() {
    return Consumer<ProfileViewModel>(builder: (context, profileViewModel, _) {
      Map<String, dynamic>? perusahaan =
          profileViewModel.currentUser?.perusahaan;
      String? nama = perusahaan?['nama'] ?? '';
      String? alamat = perusahaan?['alamat'] ?? '';
      String? npwp = perusahaan?['npwp'] ?? '';
      int? penghasilan = perusahaan?['penghasilan'] ?? 0;

      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: const Text(
                            'Nama Perusahaan:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text('$nama'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: const Text(
                            'Alamat Perusahaan:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text('$alamat'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: const Text(
                            'No NPWP Perusahaan:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text('$npwp'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: const Text(
                            'Penghasilan:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (penghasilan == 0)
                          Text('-- tidak/belum di set --')
                        else if (penghasilan == 1)
                          Text('< 100 Juta')
                        else if (penghasilan == 2)
                          Text('100 - 500 Juta')
                        else
                          Text('> 500 Juta')
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => const EditProfilePerusahaan()),
                );
              },
              child: const Text('Edit Profil Perusahaan'),
            ),
          ],
        ),
      );
    });
  }
}
