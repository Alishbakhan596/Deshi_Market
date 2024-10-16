import 'package:e_commerce_fruits_app/widgets/ProductCard/categoryModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productgridcard extends StatelessWidget {
  final onTap;
  final CategoryModel categorymodel;

  const Productgridcard({
    super.key,
    required this.categorymodel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () {
          Get.off(categorymodel.screen);
        },
        child: Container(
          padding: EdgeInsets.only(top: height * 0.03, left: width * 0.03),
          height: height * 0.3,
          width: width * 0.15,
          decoration: BoxDecoration(
              color: categorymodel.color,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: categorymodel.borderColor)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                categorymodel.imageAsset,
                height: height * 0.2,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                categorymodel.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff181725)),
              )
            ],
          ),
        ));
  }
}
