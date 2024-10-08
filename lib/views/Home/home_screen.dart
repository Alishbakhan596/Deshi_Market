import 'package:e_commerce_fruits_app/Utils/constants/colors.dart';
import 'package:e_commerce_fruits_app/services/Provider/provider_state.dart';
import 'package:e_commerce_fruits_app/widgets/CustomWidgetGridViewCard/grid_view_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/ProductCard/categoryModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteItem>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.08),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Image.asset(
                "assets/Icons/carrot.png",
              ),
              SizedBox(width: width * 0.15),
              Icon(Icons.location_on, size: 30),
              Text(
                "Karachi/Pakistan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Search Store',
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              suffixIcon: Icon(Icons.search, size: 28, color: Green),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                  )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: height * 0.2,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("assets/Logo/banner.png"),
                    fit: BoxFit.contain)),
          ),
          SizedBox(height: 20),
          Container(
            height: height * 0.04,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Exclusive Offer",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18, color: Green),
                )
              ],
            ),
          ),
          FruitsListGridWidget(products: provider.itemListOne),
          SizedBox(height: 20),
          Container(
            height: height * 0.04,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Selling",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18, color: Green),
                )
              ],
            ),
          ),
          FruitsListGridWidget(products: provider.itemListTwo),
          SizedBox(height: 20),
          Container(
            height: height * 0.04,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Groceries",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18, color: Green),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Product(),
          FruitsListGridWidget(products: provider.itemListThree),
          SizedBox(height: height * 0.2),
          // BottomNavigationMenu(),
        ]),
      ),
    ));
  }
}

class Product extends StatelessWidget {
  final List<Category> categories = [
    Category(
      imageAsset: 'assets/Fruits/pulses.png',
      color: const Color(0xffFDE598).withOpacity(0.25),
      borderColor: const Color(0xffFDE598),
      text: 'Pulses',
    ),
    Category(
        imageAsset: 'assets/Fruits/rice.png',
        color: const Color(0xffB7DFF5).withOpacity(0.25),
        borderColor: const Color(0xffB7DFF5),
        text: 'Rice'),
  ];
  Product({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 15.0, crossAxisSpacing: 13,
          childAspectRatio: 0.8, // Adjust the aspect ratio (width / height)
        ),
        itemBuilder: (context, index) {
          // Ensure you're not accessing an out-of-bounds index
          // if (index < categories.length) {
          //   return Productgridcard(
          //     categorymodel: categories[index],
          //     // onTap: () => Get.to(() => const BeverageScreen()),
          //   );
          // } else {
          //   return const SizedBox
          //       .shrink(); // Return an empty widget if index is out of bounds
          // }
        });
  }
}
