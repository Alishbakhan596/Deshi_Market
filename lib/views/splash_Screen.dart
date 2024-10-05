import 'dart:async';

import 'package:e_commerce_fruits_app/Utils/constants/colors.dart';
import 'package:e_commerce_fruits_app/views/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Green,
      body: Column(
        children: [
          SizedBox(height: 190),
          Center(
            child: Container(
              alignment: Alignment.center,
              child: Image.asset("assets/Logo/Group 3.png"),
            ),
          ),
          Container(
            child: Text(
              "DESHI MART",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
