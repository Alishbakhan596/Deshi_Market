import 'package:e_commerce_fruits_app/Utils/constants/colors.dart';
import 'package:e_commerce_fruits_app/views/CartScreen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../services/Provider/favourite_provider.dart';
import '../../services/Provider/provider_state.dart';
import '../../widgets/CartScreeWidgets/countingIcons.dart';
import '../ItemsModel/fruits_models_list.dart';

class DetailScreenModel extends StatelessWidget {
  const DetailScreenModel({
    super.key,
    required this.product,
  });

  final ItemModel product;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<FavouriteItem>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // print('OK GO');
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // Remove any default shadow color
          backgroundColor: Colors.white,

          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new_outlined)),
          actions: [
            Consumer<FavouriteItem>(
                builder: (context, value, child) => Stack(
                      children: [
                        Positioned(
                            top: 15,
                            right: 0,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Green,
                              child: Text(
                                  value.selectedFavourites.length.toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )),
                        IconButton(
                            onPressed: () {
                              Get.to(() => const CartScreen());
                            },
                            icon: const Icon(Icons.shopping_bag_outlined,
                                size: 33)),
                      ],
                    )),
            SizedBox(width: width * 0.04),
          ],
        ),
        body: SingleChildScrollView(
          child: Consumer<FavoriteProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  /// Fix for Expanded widget usage
                  Container(
                    height: height * 0.35,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        // boxShadow: [BoxShadow(blurRadius: 0.2)],
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage(product.productThumbNail),
                            fit: BoxFit.cover)), // Adjust height accordingly
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.productName,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: height * 0.02),
                                  Text(product.productDescription),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  value.favouriteSelected(product);
                                },
                                icon: Icon(
                                  value.selectedFavourites.contains(product)
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                ),
                                color:
                                    value.selectedFavourites.contains(product)
                                        ? Green
                                        : Colors.black,
                              ),
                            ]),
                        SizedBox(height: height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                /// Remove Button
                                CountingIcons(
                                  icon: Icons.remove,
                                  color: Grey,
                                  onPressed: () {},
                                ),
                                SizedBox(width: width * 0.03),

                                /// Quantity Display
                                const Text(
                                  "1", // Display current quantity
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: width * 0.03),

                                /// Add Button
                                CountingIcons(
                                  icon: Icons.add,
                                  color: Green,
                                  onPressed: () {},
                                ),
                                SizedBox(width: width * 0.20),
                              ],
                            ),
                            Text(
                              product.unitPrice,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        const Divider(),
                        SizedBox(height: height * 0.02),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Product Detail',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        const Text(
                          "Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart as part of a healthful and varied diet.",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: height * 0.02),
                        const Divider(),
                        SizedBox(height: height * 0.02),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nutrition's",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.keyboard_arrow_right_outlined)
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        const Divider(),
                        SizedBox(height: height * 0.02),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Review',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(Icons.keyboard_arrow_right_outlined)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: Consumer<FavouriteItem>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: height * 0.06,
              width: width,
              child: ElevatedButton(
                onPressed: () {
                  value.favouriteSelected(product);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff53B175),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Add To Basket',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ));
  }
}
