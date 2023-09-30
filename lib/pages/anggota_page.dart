import 'package:denaya_apps/components/my_appbar.dart';
import 'package:denaya_apps/utils/themes.dart';
import 'package:flutter/material.dart';

class AnggotaPage extends StatefulWidget {
  const AnggotaPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnggotaPageState createState() => _AnggotaPageState();
}

class _AnggotaPageState extends State<AnggotaPage> {
  int currentPage = 0; // Variabel untuk menyimpan index halaman saat ini.

  // Daftar berisi informasi dari setiap developer.
  final List<Map<String, String>> developers = [
    {
      'name': 'Athaya Rizqia Fitriani',
      'nim': '124210071',
      'image': 'assets/img/athaya.png',
    },
    {
      'name': 'Devita Khoirunnisa`i',
      'nim': '124210067',
      'image': 'assets/img/devita.png',
    },
    {
      'name': 'Nadira Nur Wiradatya',
      'nim': '124210068',
      'image': 'assets/img/nadira.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: 'Daftar Anggota', leading: true),
      body: PageView.builder(
        itemCount: developers.length, // Total halaman berdasarkan jumlah developer.
        onPageChanged: (index) {
          setState(() {
            currentPage = index; // Memperbarui index saat halaman digeser.
          });
        },
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage: AssetImage(developers[index]['image'] ?? 'path_to_default_image.png'), // Menampilkan gambar developer.
                ),
                const SizedBox(height: 10),
                Text(
                  'Nama: ${developers[index]['name']}', // Menampilkan nama developer.
                  style: DenayaFonts(context).semiBoldQuicksand(size: 20),
                ),
                const SizedBox(height: 5),
                Text(
                  'NIM: ${developers[index]['nim']}', // Menampilkan NIM developer.
                  style: DenayaFonts(context).semiBoldQuicksand(size: 18),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
