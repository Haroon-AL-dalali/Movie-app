import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/colors.dart';
import 'package:movieapp/layout.dart';

class Saplash extends StatefulWidget {
  const Saplash({super.key});

  @override
  State<Saplash> createState() => _SaplashState();
}

class _SaplashState extends State<Saplash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Layout())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.scaffoldBgColor,
      body: 

              Center(
                child: Image.asset('assets/net7.png',
                
                width: double.infinity,
                ),
              ),
    
              );
  
  }
}
