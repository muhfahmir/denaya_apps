import 'package:denaya_apps/components/loading.dart';
import 'package:denaya_apps/components/my_appbar.dart';
import 'package:denaya_apps/pages/anggota_page.dart';
import 'package:denaya_apps/utils/themes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AnggotaPage()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 3,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: DenayaColors.anggota,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.person),
                    Text('Daftar Anggota'),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 3,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: DenayaColors.stopWatch,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                children: [
                  Icon(Icons.person),
                  Text('Daftar Anggota'),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 3,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: DenayaColors.situsRekomendasi,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                children: [
                  Icon(Icons.person),
                  Text('Daftar Anggota'),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 3,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: DenayaColors.favorite,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                children: [
                  Icon(Icons.person),
                  Text('Daftar Anggota'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
