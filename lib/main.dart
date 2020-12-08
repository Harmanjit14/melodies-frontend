import 'package:flutter/material.dart';
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
      initialRoute: "/nav",
      routes: {
        "/": (context) => LoadingScreen(),
        "/nav":(context)=>Navigation(),
      },
    );
  }
}
