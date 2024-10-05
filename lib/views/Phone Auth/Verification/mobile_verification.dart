import 'package:e_commerce_fruits_app/views/Phone%20Auth/OTP/Otp_verification.dart';
import 'package:e_commerce_fruits_app/views/Phone%20Auth/phoneLogin/phone_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileVerification extends StatefulWidget {
  const MobileVerification({super.key});

  @override
  State<MobileVerification> createState() => _MobileVerificationState();
}

class _MobileVerificationState extends State<MobileVerification> {
  final TextEditingController _phoneNumberController = TextEditingController();

  Future<void> _submitPhoneNumber(BuildContext context) async {
    String phoneNumber = _phoneNumberController.text.trim();
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          print(e.message.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
          Get.off(OtpVerification(
            verificationId: verificationId,
          ));
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
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
                  Get.to(PhoneScreen());
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              SizedBox(height: 15),
              Text(
                "Enter your mobile number",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
              const Text(
                "Mobile Number",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '',
                  // prefixIcon: CountryCodePicker(
                  //   initialSelection: 'PK',
                  //   onChanged: (value) {},
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await FirebaseAuth.instance.verifyPhoneNumber(
          //     verificationCompleted: (PhoneAuthCredential credential) {},
          //     verificationFailed: (FirebaseAuthException ex) {},
          //     codeSent: (String verificationId, int? resendtoken) {
          //       Get.off(OtpVerification(verificationId: verificationId));
          //     },
          //     codeAutoRetrievalTimeout: (String verificationId) {},
          //     phoneNumber: _phoneNumberController.text.toString());
          // await FirebaseAuth.instance.verifyPhoneNumber(
          //     phoneNumber: _phoneNumberController.text,
          //     verificationCompleted: (PhoneAuthCredential) {},
          //     verificationFailed: (error) {
          //       print(error);
          //     },
          //     codeSent: (verificationId, forceResendingToken) {
          //       Get.off(OtpVerification(
          //         verificationId: verificationId,
          //       ));
          //     },
          //     codeAutoRetrievalTimeout: (verificationId) {});
          _submitPhoneNumber(context);
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
