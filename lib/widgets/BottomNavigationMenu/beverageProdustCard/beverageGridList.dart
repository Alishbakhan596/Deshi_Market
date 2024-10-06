import 'package:e_commerce_fruits_app/Models/beveragesModel/beveragesModel.dart';
import 'package:e_commerce_fruits_app/widgets/BottomNavigationMenu/beverageProdustCard/beverageCard.dart';
import 'package:flutter/material.dart';

class BeverageGridList extends StatelessWidget {
  final List<BeveragesModel> beverage = [
    BeveragesModel(
        'assets/Images/cd1.png', 'Diet Coke', '355ml, Price', '\$1.99'),
    BeveragesModel(
        'assets/Images/cd2.png', 'Sprite Can', '325ml, Price', '\$1.50'),
    BeveragesModel(
        'assets/Images/j1.png', 'Apple & Grape Juice', '2L, Price', '\$1.66'),
    BeveragesModel(
        'assets/Images/j2.png', 'Orenge Juice', '2L, Price', '\$1.79'),
    BeveragesModel(
        'assets/Images/cd3.png', 'Coca Cola Can', '325ml, Price', '\$2.99'),
    BeveragesModel(
        'assets/Images/cd4.png', 'Pepsi Can', '330ml, Price', '\$1.97'),
  ];
  BeverageGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 15.0, crossAxisSpacing: 13,
          childAspectRatio: 0.68, // Adjust the aspect ratio (width / height)
        ),
        itemBuilder: (context, index) {
          // Ensure you're not accessing an out-of-bounds index
          if (index < beverage.length) {
            return Beveragecard(
              beverage: beverage[index],
            );
          } else {
            return const SizedBox
                .shrink(); // Return an empty widget if index is out of bounds
          }
        });
  }
}
