import 'package:e_commerce_fruits_app/services/auth/auth_service.dart';
import 'package:e_commerce_fruits_app/views/Home/home_screen.dart';
import 'package:e_commerce_fruits_app/views/Login/login_screen.dart';
import 'package:e_commerce_fruits_app/widgets/custom_text_field.dart';
import 'package:e_commerce_fruits_app/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/constants/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
  }

  void signUpUser() async {
    String res = await AuthService().signUpUser(
        email: emailController.text,
        password: passwordController.text,
        name: usernameController.text);
    if (res == "success") {
      setState(() {
        isLoading = true;
      });
      Get.offAll(() => HomeScreen());
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/Icons/carrot.png",
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Enter your credentials to continue",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.bottomLeft,
              child:
                  Text("Username", style: TextStyle(fontSize: 14, color: Grey)),
            ),
            CustomTextField(
              obscureValue: false,
              controller: usernameController,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.bottomLeft,
              child: Text("Email", style: TextStyle(fontSize: 14, color: Grey)),
            ),
            CustomTextField(
              obscureValue: false,
              controller: emailController,
            ),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.bottomLeft,
                child: Text("Password",
                    style: TextStyle(fontSize: 14, color: Grey))),
            CustomTextField(
              obscureValue: true,
              controller: passwordController,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "By continuing you agree to our ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "Terms of",
                        style: TextStyle(color: Color(0xff53B175)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Service ",
                        style: TextStyle(color: Color(0xff53B175)),
                      ),
                      Text(
                        "and ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "Privacy Police",
                        style: TextStyle(color: Color(0xff53B175)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: SizedBox(
                height: height * 0.08,
                width: width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xff53B175),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      signUpUser();
                      Get.offAll(() => HomeScreen());
                    }),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {
                    Get.offAll(() => LoginScreen());
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff53B175)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
