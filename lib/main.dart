import 'package:flutter/material.dart';
import 'package:melodies/pages/auth.dart';
import 'package:melodies/pages/loadingscreen.dart';
import 'package:melodies/pages/navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melodies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: "/auth",
      routes: {
        "/": (context) => LoadingScreen(),
        "/auth": (context) => Authentication(),
        "/nav": (context) => Navigation(),
      },
    );
  }
}
