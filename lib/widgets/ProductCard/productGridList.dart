import 'package:e_commerce_fruits_app/views/Products/beverage_screen.dart';
import 'package:e_commerce_fruits_app/widgets/ProductCard/categoryModel.dart';
import 'package:e_commerce_fruits_app/widgets/ProductCard/productGridCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productgridlist extends StatelessWidget {
  final List<CategoryModel> categories = [
    CategoryModel(
      imageAsset: 'assets/Images/veg.png',
      color: const Color(0xff53b175).withOpacity(0.1),
      borderColor: const Color(0xff53b175).withOpacity(0.7),
      text: 'Fresh Fruits\n& Vegetables',
    ),
    CategoryModel(
        imageAsset: 'assets/Images/oils.png',
        color: const Color(0xfff8a44c1a).withOpacity(0.1),
        borderColor: const Color(0xfff8a44c1a).withOpacity(0.7),
        text: 'Cooking Oil\n& Ghee'),
    CategoryModel(
        imageAsset: 'assets/Images/meat.png',
        color: const Color(0xffF7A593).withOpacity(0.25),
        borderColor: const Color(0xffF7A593),
        text: 'Meet & Fish'),
    CategoryModel(
        imageAsset: 'assets/Images/bakery.png',
        color: const Color(0xffD3B0E0).withOpacity(0.1),
        borderColor: const Color(0xffD3B0E0),
        text: 'Bakery & Snacks'),
    CategoryModel(
        imageAsset: 'assets/Images/mlk.png',
        color: const Color(0xffFDE598).withOpacity(0.25),
        borderColor: const Color(0xffFDE598),
        text: 'Dairy & Eggs'),
    CategoryModel(
        screen: const BeverageScreen(),
        imageAsset: 'assets/Images/beve.png',
        color: const Color(0xffB7DFF5).withOpacity(0.25),
        borderColor: const Color(0xffB7DFF5),
        text: 'Beverages'),
  ];
  Productgridlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 13,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          if (index < categories.length) {
            return Productgridcard(
              categorymodel: categories[index],
              onTap: () => Get.to(() => const BeverageScreen()),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
