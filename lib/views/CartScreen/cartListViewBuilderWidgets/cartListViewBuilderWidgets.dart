import 'package:e_commerce_fruits_app/Utils/constants/colors.dart';
import 'package:e_commerce_fruits_app/services/Provider/provider_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/CartScreeWidgets/countingIcons.dart';

class CartListViewBuilderWidgets extends StatelessWidget {
  const CartListViewBuilderWidgets({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteItem>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<FavouriteItem>(
      builder: (context, value, child) {
        if (value.selectedFavourites.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/Images/empty_cart.png'),
              ),
              Center(
                  child: Text('Your cart is empty',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ))),
              Text(
                "Explore products and shop your",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 20),
              Text(
                "favourite items",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          );
        } else {
          return Expanded(
            child: ListView.builder(
              itemCount: provider.selectedFavourites.length,
              itemBuilder: (context, index) {
                final item = value.selectedFavourites[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(image: AssetImage(item.images)),
                              SizedBox(width: 5 //width * 0.01
                                  ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item.productName,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600)),
                                      Text(item.productDescription,
                                          style: TextStyle(
                                              fontSize: 16, color: Grey)),
                                      SizedBox(height: height * 0.1),
                                      Row(
                                        children: [
                                          CountingIcons(
                                            icon: Icons.remove,
                                            color: Grey,
                                            onPressed: () {
                                              int currentQuantity =
                                                  value.itemQuantities[
                                                          item.productId] ??
                                                      1;
                                              if (currentQuantity > 1) {
                                                value.updateQuantity(
                                                    item, currentQuantity - 1);
                                              }
                                            },
                                          ),
                                          SizedBox(width: width * 0.03),
                                          Text(
                                            '${value.itemQuantities[item.productId] ?? 1}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(width: width * 0.03),
                                          CountingIcons(
                                            icon: Icons.add,
                                            color: Green,
                                            onPressed: () {
                                              int currentQuantity =
                                                  value.itemQuantities[
                                                          item.productId] ??
                                                      1;
                                              value.updateQuantity(
                                                  item, currentQuantity + 1);
                                            },
                                          ),
                                          SizedBox(width: width * 0.20),
                                          Text(
                                            '\$${(double.parse(item.unitPrice.substring(1)) * (value.itemQuantities[item.productId] ?? 1)).toStringAsFixed(2)}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    value.removeFromFavourites(item);
                                  },
                                  child: const Icon(Icons.delete)))
                        ],
                      ),
                      SizedBox(height: height * 0.03),
                      Divider(color: Colors.grey.withOpacity(0.3)),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
