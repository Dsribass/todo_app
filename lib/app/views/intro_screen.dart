import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),() => {
      Navigator.pushReplacementNamed(context, '/home')
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(color: Colors.red),
        child: Icon(
          Icons.check,
          size: 60,
          color: Colors.white,
        ),
      )),
    );
  }
}
