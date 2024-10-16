import 'package:e_commerce_fruits_app/views/CartScreen/cartListViewBuilderWidgets/cartListViewBuilderWidgets.dart';
import 'package:e_commerce_fruits_app/widgets/BottomNavigationMenu/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Utils/constants/colors.dart';
import '../../services/Provider/provider_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.06),
        child: Column(
          children: [
            Center(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.to(() => const BottomNavigationMenu());
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Text('My Cart',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Consumer<FavouriteItem>(
                      builder: (context, value, child) => Stack(
                            children: [
                              Positioned(
                                  top: 15,
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Colors.red,
                                    child: Text(
                                        value.selectedFavourites.length
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.shopping_bag_outlined,
                                      size: 33)),
                            ],
                          )),
                ],
              ),
            )),
            Divider(color: Colors.grey.withOpacity(0.3)),
            SizedBox(height: height * 0.02),
            const CartListViewBuilderWidgets()
          ],
        ),
      ),
      bottomNavigationBar: Consumer<FavouriteItem>(
        builder: (context, value, child) {
          return value.selectedFavourites.isNotEmpty
              ? Container(
                  margin: EdgeInsets.only(
                      left: width * 0.12,
                      bottom: height * 0.02,
                      right: width * 0.12),
                  height: height * 0.06,
                  width: width * 0.05,
                  child: SizedBox(
                    child: ElevatedButton(
                        onPressed: () {
                          //StripeServices.instance.makePayment();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: Text('Go to Checkout   ${value.getTotalPrice()}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ))
              : const SizedBox();
        },
      ),
    );
  }
}
