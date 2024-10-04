import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      required this.obscureValue});

  final controller;
  final hintText;
  final prefixIcon;
  final suffixIcon;
  final bool obscureValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      alignment: Alignment.bottomLeft,
      child: TextFormField(
        obscureText: obscureValue,
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(suffixIcon),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 2, color: Colors.black)),
        ),
      ),
    );
  }
}
