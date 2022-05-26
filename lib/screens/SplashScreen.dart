import 'dart:async';

import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:ilapz_test/screens/HomePage.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return state();
  }
}

class state extends State<SplashScreen>{


  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Text("iLapz Technologies"),
        ),
      ),

    );
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        ModalRoute.withName("/home"));
//    Navigator.pushNamed(context, '/home');

  }















}