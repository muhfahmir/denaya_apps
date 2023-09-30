import 'package:denaya_apps/components/my_appbar.dart';
import 'package:denaya_apps/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkRekomendasiPage extends StatefulWidget {
  const LinkRekomendasiPage({super.key});

  @override
  State<LinkRekomendasiPage> createState() => _LinkRekomendasiPageState();
}

class _LinkRekomendasiPageState extends State<LinkRekomendasiPage> {
  final List<Map<String, dynamic>> linkRekomendations = [
    {
      'name': 'Flutter',
      'link': 'https://flutter.dev/',
      'image': 'https://static-00.iconduck.com/assets.00/flutter-icon-1651x2048-ojswpayr.png',
    },
    {
      'name': 'Java',
      'link': 'https://www.java.com/en/',
      'image': 'https://cdn-icons-png.flaticon.com/512/5968/5968282.png',
    },
    {
      'name': 'PHP',
      'link': 'https://www.php.net/',
      'image': 'https://cdn-icons-png.flaticon.com/512/5968/5968332.png',
    },
    {
      'name': 'Laravel',
      'link': 'https://laravel.com/',
      'image': 'https://static-00.iconduck.com/assets.00/laravel-icon-995x1024-dk77ahh4.png',
    },
    {
      'name': 'Dart',
      'link': 'https://dart.dev/',
      'image': 'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/dart-programming-language-icon.png',
    }
  ];

  _launchURL(dynamic url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: 'Link Rekomendasi', leading: true),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom yang diinginkan
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: linkRekomendations.length,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () {
                  _launchURL(Uri.parse(linkRekomendations[index]['link']));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.network(
                          linkRekomendations[index]['image'],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(linkRekomendations[index]['name'], style: DenayaFonts(context).boldQuicksand(size: 16)),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
