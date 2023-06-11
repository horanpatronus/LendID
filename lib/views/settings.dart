import 'package:flutter/material.dart';
import 'package:homepage/views/login_page.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<String> listViewItems = [
    'FAQ',
    'Ketentuan Layanan',
    'Kebijakan Privasi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bantuan'),
        backgroundColor: Color(0xFF005555),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listViewItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = listViewItems[index];
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(item),
                          onTap: () {
                            _showModal(context, item);
                          },
                        ),
                        const Divider(
                          height: 1,
                          color: Colors.grey,
                          indent: 16,
                          endIndent: 16,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Set the background color to red
                  ),
                  child: const Text('Logout'),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'page2.png', // Ganti dengan path gambar Anda
                        width: 235,
                        height: 235,
                        fit: BoxFit.contain, // Atur properti fit
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'LENDID - V1.0',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Navigasi(),
          const NavigasiMid(),
        ],
      ),
    );
  }

  void _showModal(BuildContext context, String title) {
    Widget contentWidget;

    switch (title) {
      case 'FAQ':
        contentWidget = _buildFAQContent();
        break;
      case 'Ketentuan Layanan':
        contentWidget = _buildTermsContent();
        break;
      case 'Kebijakan Privasi':
        contentWidget = _buildPrivacyContent();
        break;
      default:
        contentWidget = Container();
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: contentWidget,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildFAQContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 10),
        Text(
          '1. Apa itu Bantuan Khusus?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Bantuan Khusus adalah sebuah fitur yang dirancang untuk membantu pengguna dalam menemukan solusi atas pertanyaan umum dan permasalahan yang sering muncul dalam aplikasi kami.',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 10),
        Text(
          '2. Mengapa aplikasi saya tidak bisa memuat halaman?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Ada beberapa kemungkinan penyebab mengapa aplikasi Anda tidak bisa memuat halaman. Beberapa langkah yang bisa Anda coba adalah:',
          style: TextStyle(fontSize: 14),
        ),
        Text(
          '- Periksa koneksi internet Anda dan pastikan Anda terhubung dengan jaringan yang stabil.',
          style: TextStyle(fontSize: 14),
        ),
        Text(
          '- Coba restart aplikasi Anda dan cek apakah masalahnya teratasi.',
          style: TextStyle(fontSize: 14),
        ),
        Text(
          '- Jika masalah masih berlanjut, coba hapus data cache aplikasi dan coba lagi.',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildTermsContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 10),
          Text(
            '1. Penggunaan Layanan',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Dengan menggunakan layanan kami, Anda setuju untuk mematuhi ketentuan dan kondisi yang ditetapkan.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 10),
          Text(
            '2. Kewajiban Pengguna',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Pengguna bertanggung jawab untuk menjaga kerahasiaan informasi login dan tidak mengungkapkannya kepada pihak ketiga.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 10),
          Text(
            '3. Batasan Tanggung Jawab',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Kami tidak bertanggung jawab atas kerugian atau kerusakan yang disebabkan oleh penggunaan layanan kami.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 10),
          Text(
            '4. Perubahan Ketentuan',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Kami berhak untuk mengubah ketentuan layanan ini setiap saat tanpa pemberitahuan sebelumnya.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 10),
          Text(
            '1. Informasi yang Kami Kumpulkan',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Kami dapat mengumpulkan informasi pribadi yang Anda berikan saat menggunakan layanan kami, seperti nama, alamat email, dan informasi kontak lainnya.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 10),
          Text(
            '2. Penggunaan Informasi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Informasi yang kami kumpulkan dapat digunakan untuk tujuan seperti memberikan layanan, mengelola akun pengguna, dan meningkatkan pengalaman pengguna.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 10),
          Text(
            '3. Pengungkapan Informasi kepada Pihak Ketiga',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Kami tidak akan mengungkapkan informasi pribadi Anda kepada pihak ketiga tanpa persetujuan Anda, kecuali dalam keadaan tertentu yang diizinkan oleh undang-undang.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 10),
          Text(
            '4. Keamanan Informasi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Kami mengambil langkah-langkah yang wajar untuk melindungi informasi pribadi Anda dari akses, penggunaan, atau pengungkapan yang tidak sah.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
