import 'package:e_commerce_fruits_app/views/SignUp/signup_Screen.dart';
import 'package:e_commerce_fruits_app/views/forgotPassword/forgot_password.dart';
import 'package:e_commerce_fruits_app/widgets/custom_text_field.dart';
import 'package:e_commerce_fruits_app/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/constants/colors.dart';
import '../../services/auth/auth_service.dart';
import '../Home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void LoginUsers() async {
    String res = await AuthService().LoginUser(
      email: emailController.text,
      password: passwordController.text,
    );
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
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/Icons/carrot.png",
            ),
          ),
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Loging",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Enter your emails and password",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.bottomLeft,
            child: Text("Email", style: TextStyle(fontSize: 14, color: Grey)),
          ),
          CustomTextField(
            obscureValue: false,
            controller: emailController,
          ),
          SizedBox(height: 20),
          Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.bottomLeft,
              child: Text("Password",
                  style: TextStyle(fontSize: 14, color: Grey))),
          CustomTextField(
            obscureValue: true,
            controller: passwordController,
          ),
          SizedBox(height: 10),
          const ForgotPassword(),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: SizedBox(
              height: height * 0.08,
              width: width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xff53B175),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text(
                  "Log In",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  LoginUsers();
                  //Get.offAll(() => HomeScreen());
                },
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.offAll(() => SignupScreen());
                },
                child: Text(
                  "Signup",
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
    );
  }
}
