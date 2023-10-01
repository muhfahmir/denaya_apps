import 'dart:convert';

import 'package:denaya_apps/components/flushbar.dart';
import 'package:denaya_apps/components/my_appbar.dart';
import 'package:denaya_apps/db/local.dart';
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
      'id': 1,
      'name': 'Flutter',
      'link': 'https://flutter.dev/',
      'image': 'https://static-00.iconduck.com/assets.00/flutter-icon-1651x2048-ojswpayr.png',
    },
    {
      'id': 2,
      'name': 'Java',
      'link': 'https://www.java.com/en/',
      'image': 'https://cdn-icons-png.flaticon.com/512/5968/5968282.png',
    },
    {
      'id': 3,
      'name': 'PHP',
      'link': 'https://www.php.net/',
      'image': 'https://cdn-icons-png.flaticon.com/512/5968/5968332.png',
    },
    {
      'id': 4,
      'name': 'Laravel',
      'link': 'https://laravel.com/',
      'image': 'https://static-00.iconduck.com/assets.00/laravel-icon-995x1024-dk77ahh4.png',
    },
    {
      'id': 5,
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

  List<dynamic> items = [];

  Future<void> _loadItems() async {
    final source = SaveToLocalDb.getString('favorite');
    List<dynamic> itemsDb = source == null ? [] : jsonDecode(source);
    if (itemsDb.isNotEmpty) {
      setState(() {
        items = itemsDb;
      });
    }
  }

  @override
  void initState() {
    _loadItems();
    super.initState();
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
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  _launchURL(Uri.parse(linkRekomendations[index]['link']));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.network(
                          linkRekomendations[index]['image'],
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(linkRekomendations[index]['name'], style: DenayaFonts(context).boldQuicksand(size: 16)),
                          IconButton(
                            onPressed: () {
                              if (items.every((item) => item['id'] != linkRekomendations[index]['id'])) {
                                setState(() {
                                  items.add(linkRekomendations[index]);
                                });
                                SaveToLocalDb.setString('favorite', jsonEncode(items));
                                alert(context, icon: Icons.check, color: Colors.green, text: 'Data ${linkRekomendations[index]['name']} berhasil di tambahkan');
                              } else {
                                items.removeWhere((item) => item['id'] == linkRekomendations[index]['id']);
                                alert(context, icon: Icons.delete, color: Colors.red, text: 'Data ${linkRekomendations[index]['name']} berhasil di hapus');
                                SaveToLocalDb.setString('favorite', jsonEncode(items));
                                setState(() {
                                  _loadItems();
                                });
                              }
                            },
                            icon: Icon(items.every((item) => item['id'] != linkRekomendations[index]['id']) ? Icons.favorite_border : Icons.favorite, color: Colors.red),
                          )
                        ],
                      ),
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
