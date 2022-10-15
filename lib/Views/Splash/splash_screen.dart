import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Bottom_Navigation/bottom_navigation.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffffffff),
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Image(
            image: AssetImage("assets/admin.jpg"),
            fit: BoxFit.contain,
          ),
        )
      // FlutterLogo(size:MediaQuery.of(context).size.height),
    );
  }
}
