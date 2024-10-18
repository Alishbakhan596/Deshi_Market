import 'package:e_commerce_fruits_app/views/Home/home_screen.dart';
import 'package:e_commerce_fruits_app/widgets/BottomNavigationMenu/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/ProductCard/productGridList.dart';

class FindProductsScreen extends StatelessWidget {
  const FindProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          IconButton(
              onPressed: () {
                Get.off(HomeScreen());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigationMenu()));
              },
              icon: Icon(Icons.arrow_back)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.06),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Find Products',
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w800))
                  ],
                ),
                SizedBox(height: height * 0.034),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Search Store',
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.4)),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2),
                      prefixIcon: const Icon(Icons.search,
                          size: 28, color: Colors.black),
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
                SizedBox(height: height * 0.9, child: Productgridlist())
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
