import 'package:flutter/material.dart';
import 'package:homepage/views/search.dart';
import 'package:homepage/views/usulan_peminjaman.dart';
import 'package:provider/provider.dart';
import 'package:homepage/viewmodels/login_viewmodel.dart';

bool isMember = false;

class NavigasiMid extends StatelessWidget {
  const NavigasiMid({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) => LoginViewModel(),
      child: Builder(builder: (context) {
        final loginViewModel = Provider.of<LoginViewModel>(context);

        return FutureBuilder(
            future: Future.wait([loginViewModel.getCurrentUser()]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                String? role = loginViewModel.currentUser?.role;
                bool isMember = role == 'UMKM';

                return Align(
                  alignment: const Alignment(0, 0.9),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          isMember
                              ? MaterialPageRoute(
                                  //pergi ke halaman plus button
                                  builder: (context) =>
                                      const UsulanPeminjaman(),
                                )
                              : MaterialPageRoute(
                                  //pergi ke halaman search button
                                  builder: (context) => const SearchButton(),
                                ));
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xff005555),
                        border: Border.all(
                          color: Colors.white,
                          width: 5.0,
                        ),
                      ),
                      child: Icon(
                        isMember ? Icons.add : Icons.search_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                );
              }
            });
      }),
    );
    //end search button
  }
}
