import 'package:e_commerce_fruits_app/Utils/constants/colors.dart';
import 'package:e_commerce_fruits_app/services/Provider/provider_state.dart';
import 'package:e_commerce_fruits_app/widgets/CustomWidgetGridViewCard/grid_view_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        body: Padding(
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 3))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 300,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search Store",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Icon(Icons.search, color: Green),
              ],
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
        FruitsListGridWidget(products: provider.itemListThree),
        SizedBox(height: height * 0.2),
       
      ]),
    ));
  }
}
