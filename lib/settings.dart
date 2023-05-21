import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<String> listViewItems = [
    'FAQ',
    'Bantuan',
    'Ketentuan Layanan',
    'Kebijakan Privasi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
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
                    Divider(
                      height: 1,
                      color: Colors.grey,
                      indent: 16,
                      endIndent: 16,
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'page2.png', // Ganti dengan path gambar Anda
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain, // Atur properti fit
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'LENDID - V1.0',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          if (index == 0) {
            // Navigasi ke halaman beranda
          } else if (index == 1) {
            // Tetap di halaman pengaturan (current page)
          }
        },
      ),
    );
  }

  void _showModal(BuildContext context, String title) {
    Widget contentWidget;

    switch (title) {
      case 'FAQ':
        contentWidget = _buildFAQContent();
        break;
      case 'Bantuan':
        contentWidget = _buildHelpContent();
        break;
      case 'Ketentuan Layanan':
        contentWidget = _buildTermsContent();
        break;
      case 'Kebijakan Privasi':
        contentWidget = _buildPrivacyContent();
        break;
      default:
        contentWidget =
            Container(); // Set a default value in case no match is found
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: contentWidget,
          actions: <Widget>[
            TextButton(
              child: Text('Tutup'),
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
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: 'Pertanyaan yang Sering Ditanyakan\n\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
          TextSpan(
            text: 'Ini adalah konten FAQ yang khusus',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpContent() {
    return Text('Ini adalah konten Bantuan yang khusus');
  }

  Widget _buildTermsContent() {
    return Text('Ini adalah konten Ketentuan Layanan yang khusus');
  }

  Widget _buildPrivacyContent() {
    return Text('Ini adalah konten Kebijakan Privasi yang khusus');
  }
}
