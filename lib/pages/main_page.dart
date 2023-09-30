import 'package:denaya_apps/components/my_appbar.dart';
import 'package:denaya_apps/pages/help_page.dart';
import 'package:denaya_apps/pages/home_page.dart';
import 'package:denaya_apps/utils/utils.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0; //New

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body() {
      switch (_currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const HelpPage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      appBar: myAppBar(context,
          title: 'Denaya Apps',
          automaticImplyLeading: false,
          action: [
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: DenayaColors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Bantuan',
          ),
        ],
      ),
      body: body(),
    );
  }
}
