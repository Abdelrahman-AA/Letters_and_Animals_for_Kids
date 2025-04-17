import 'package:animals_v3/home.dart';
import 'package:animals_v3/temp.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Temp(),
      routes: {
        "home": (context) => Home(),
        "temp": (context) => Temp(),
      },
    );
  }
}
