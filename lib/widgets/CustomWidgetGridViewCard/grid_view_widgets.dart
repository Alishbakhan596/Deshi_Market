import 'package:e_commerce_fruits_app/widgets/CustomWidgetGridViewCard/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/Details/detail_screen.dart';
import '../../Models/ItemsModel/fruits_models_list.dart';

class FruitsListGridWidget extends StatelessWidget {
  const FruitsListGridWidget({super.key, required this.products});

  final List<ItemModel> products;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: height * 0.01),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: height * 0.32,
          crossAxisSpacing: width * 0.03,
          mainAxisSpacing: height * 0.03,
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GridCard(
          product: products[index],
          onPressed: () => Get.to(() => DetailScreenModel(
                product: products[index],
              )),
        );
      },
    );
  }
}
