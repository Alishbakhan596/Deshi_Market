import 'package:e_commerce_fruits_app/views/Home/home_screen.dart';
import 'package:e_commerce_fruits_app/widgets/BottomNavigationMenu/bottom_navigation.dart';
import 'package:e_commerce_fruits_app/widgets/category/categoryGridList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.02),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.to(HomeScreen());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigationMenu()));
                },
                icon: Icon(Icons.arrow_back),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Search Store',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    prefixIcon:
                        const Icon(Icons.search, size: 28, color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                        ))),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: height * 0.9,
                child: Categorygridlist(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
