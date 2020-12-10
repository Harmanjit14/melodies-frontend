import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  Widget login() {
    return Container(
        child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset(
                    "lib/assets/animation2.gif",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  // alignment: Alignment.center,
                  child: Text(
                    "Login Here!",
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        textStyle: TextStyle(color: Colors.white),
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0.5, 0.5),
                            blurRadius: 2,
                            color: Colors.white,
                          ),
                        ]),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Email",
                    prefixIcon: Icon(
                      FontAwesomeIcons.user,
                    ),
                    hintStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(fontSize: 18),
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Password",
                    prefixIcon: Icon(FontAwesomeIcons.lock),
                    hintStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.fromLTRB(20, 25, 20, 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: RaisedButton(
                  padding: EdgeInsets.all(15),
                  onPressed: () {},
                  child: Text(
                    "Continue",
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  color: Colors.blue[800],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
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
