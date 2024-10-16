import 'package:e_commerce_fruits_app/views/Home/home_screen.dart';
import 'package:e_commerce_fruits_app/views/Products/find_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/BottomNavigationMenu/beverageProdustCard/beverageGridList.dart';

class BeverageScreen extends StatelessWidget {
  const BeverageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(FindProductsScreen());
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text('Beverages',
            style:
                TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.03),
          child: Column(
            children: [SizedBox(height: height * 1, child: BeverageGridList())],
          ),
        ),
      ),
    );
  }
}
