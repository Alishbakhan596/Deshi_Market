import 'package:e_commerce_fruits_app/Models/ItemsModel/groceryModel.dart';
import 'package:e_commerce_fruits_app/widgets/category/category_card.dart';
import 'package:flutter/material.dart';

class Categorygridlist extends StatelessWidget {
  final List<Grocerymodel> beverage = [
    Grocerymodel(
        'assets/Images/egg1.png', 'Egg Chicken Red', '4cs, Price', '\$1.99'),
    Grocerymodel(
        'assets/Images/egg2.png', 'Egg Chicken White', '180g, Price', '\$1.50'),
    Grocerymodel(
        'assets/Images/pasta.png', 'Egg Pasta', '300gm, Price', '\$15.99'),
    Grocerymodel(
        'assets/Images/egg-noodle1.png', 'Egg Noodle', '2L, Price', '\$15.99'),
    Grocerymodel(
        'assets/Images/mayo.png', 'Mayonnaise', '325ml, Price', '\$4.99'),
    Grocerymodel('assets/Images/egg noodles.png', 'Egg Noodles', '330ml, Price',
        '\$4.99'),
  ];
  Categorygridlist({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 13,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) {
          if (index < beverage.length) {
            return CategoryCard(
              beverage: beverage[index],
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
