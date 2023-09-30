import 'package:denaya_apps/utils/themes.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Untuk Menggunakan Aplikasi ini', style: DenayaFonts(context).semiBoldQuicksand(size: 18)),
                const SizedBox(height: 10),
                Text('1. Ketika dihalaman login masukan username dan password', style: DenayaFonts(context).regularQuicksand(size: 13)),
                const SizedBox(height: 10),
                Text('2. Ada 4 Menu dihalaman Home Screen', style: DenayaFonts(context).regularQuicksand(size: 13)),
                const SizedBox(height: 10),
                Text('3. Untuk Panduan silahkan ke halaman Bantuan di pilih dari Bottom Navigation Bar', style: DenayaFonts(context).regularQuicksand(size: 13)),
                const SizedBox(height: 10),
                Text('5. Data Anggota berisi data data angota yang mengerjakan project ini', style: DenayaFonts(context).regularQuicksand(size: 13)),
                const SizedBox(height: 10),
                Text('6. Stopwatch berisi logic simple untuk menampilkan jam, menampilkan detik, dan menampilkan menit', style: DenayaFonts(context).regularQuicksand(size: 13)),
                const SizedBox(height: 10),
                Text('7. Link Rekomenadasi menapilkan bahasa pemrograman untuk digunakan coding', style: DenayaFonts(context).regularQuicksand(size: 13)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
