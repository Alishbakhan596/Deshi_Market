import 'dart:developer';

import 'package:e_commerce_fruits_app/views/Home/home_screen.dart';
import 'package:e_commerce_fruits_app/views/Phone%20Auth/Verification/mobile_verification.dart';
import 'package:e_commerce_fruits_app/views/SelectLocation/select_location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerification extends StatefulWidget {
  final String verificationId;
  OtpVerification({super.key, required this.verificationId});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final TextEditingController _otpController = TextEditingController();
  //bool isLoading = false;

  Future<void> _submitOTP(BuildContext) async {
    String otp = _otpController.text.trim();
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId, smsCode: otp);
      await auth.signInWithCredential(credential);
      Get.off(SelectLocation());
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.to(MobileVerification());
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              SizedBox(height: 15),
              Text(
                "Enter your 4-digit Code",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              const Text(
                "Code",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              TextFormField(
                controller: _otpController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '- - - -',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            PhoneAuthCredential credential = await PhoneAuthProvider.credential(
                verificationId: widget.verificationId,
                smsCode: _otpController.text.toString());
            FirebaseAuth.instance
                .signInWithCredential(credential)
                .then((value) {
              Get.off(HomeScreen());
            });
          } catch (ex) {
            log(ex.toString());
          }

          _submitOTP(context);
          Get.off(SelectLocation());
        },
        backgroundColor: Color(0xff53B175),
        child: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
