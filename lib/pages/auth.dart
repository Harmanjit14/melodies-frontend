import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melodies/models/token.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  int stateBut = 0;
  Widget logChild() {
    switch (stateBut) {
      case 0:
        {
          return Text(
            "Continue",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 20, color: Colors.white)),
          );
        }
        break;
      case 1:
        {
          return SpinKitDoubleBounce(
            color: Colors.white,
            size: 30.0,
          );
        }
        break;
      case 2:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.checkCircle,
                color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Success",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          );
        }
        break;
      case 3:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.timesCircle,
                color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Check Credentials!",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          );
        }
        break;
      default:
        {
          return Text(
            "Continue",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 20, color: Colors.white)),
          );
        }
    }
  }

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
                onChanged: (val) {
                  email = val;
                },
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Email",
                    prefixIcon: Icon(
                      FontAwesomeIcons.userAlt,
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
                onChanged: (val) {
                  password = val;
                },
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
                  onPressed: () async {
                    stateBut = 1;
                    setState(() {});
                    int temp = await getToken();
                    if (temp == 1) {
                      Timer(Duration(seconds: 2), () {
                        stateBut = 2;
                        setState(() {});
                      });
                      Timer(Duration(seconds: 3), () {
                        password="";
                        Navigator.pushReplacementNamed(context, "/nav");
                      });
                    } else {
                      Timer(Duration(seconds: 2), () {
                        stateBut = 3;
                        setState(() {});
                      });
                      Timer(Duration(seconds: 4), () {
                        stateBut = 0;
                        setState(() {});
                      });
                    }
                  },
                  child: logChild(),
                  color: Colors.blue[800],
                ),
              ),
            ),
            SizedBox(height: 60),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Text(
                    "Don't have an account ?",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                  SizedBox(width: 20),
                  Container(
                    child: IconButton(
                        color: Colors.white,
                        iconSize: 30,
                        icon: Icon(FontAwesomeIcons.arrowRight),
                        onPressed: () {}),
                  ),
                ],
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
