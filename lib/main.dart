import 'package:denaya_apps/pages/login_page.dart';
import 'package:denaya_apps/utils/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DenayaApp());
}

class DenayaApp extends StatelessWidget {
  const DenayaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Denaya Apps',
      theme: ThemeData(
        fontFamily: 'QuicksandRegular',
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: DenayaColors.primary,
        focusColor: DenayaColors.primary,
        dividerColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(),
    );
  }
}
