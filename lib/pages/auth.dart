import 'dart:developer';

import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  Widget login() {
    return Container(
      child: Image.asset("lib/assets/animation2.gif")
    );
  }

  Widget register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: login()),
    );
  }
}
