import 'package:e_commerce_fruits_app/services/Provider/favourite_provider.dart';
import 'package:e_commerce_fruits_app/services/Provider/provider_state.dart';
import 'package:e_commerce_fruits_app/views/CartScreen/cart_screen.dart';
import 'package:e_commerce_fruits_app/widgets/BottomNavigationMenu/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../widgets/CustomWidgetGridViewCard/grid_view.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const BottomNavigationMenu()),
                        );
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    const Text(
                      'Favourite',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
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
                                value.selectedFavourites.length.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.to(() => const CartScreen());
                            },
                            icon: const Icon(Icons.shopping_bag_outlined,
                                size: 33),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.grey),
            SizedBox(height: height * 0.02),

            // Display the favorite items
            Expanded(
              child: Consumer<FavoriteProvider>(
                builder: (context, favouriteProvider, child) {
                  if (favouriteProvider.selectedFavourites.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/Images/empty_cart.png"),
                        Center(
                            child: Text('Your Favourite Cart is Empty',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w400))),

                        // SizedBox(height: height * 0.30),
                      ],
                    );
                  }

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Adjust based on your design
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: favouriteProvider.selectedFavourites.length,
                    itemBuilder: (context, index) {
                      var product = favouriteProvider.selectedFavourites[index];
                      return GridCard(
                        product: product,
                        onPressed: () {
                          // Handle product tap, e.g., navigate to product details
                          print("Tapped on ${product.productName}");
                          // Add navigation logic to product details page here
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
