import 'package:e_commerce_fruits_app/Utils/constants/colors.dart';
import 'package:e_commerce_fruits_app/views/Admin/Dashboard/dasboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../Category/category.dart';
import '../CouponCode/coupon_code.dart';
import '../Orders/order.dart';
import '../Products/products.dart';

class Navi extends StatefulWidget {
  const Navi({super.key});

  @override
  State<Navi> createState() => _NaviState();
}

class _NaviState extends State<Navi> {
  int _selectedIndex = 0;

  final List<Widget> _Screens = [
    const DashBoard(),
    const Products(),
    const CategoryScreen(),
    const CouponCode(),
    const Orders(),
  ];

  void _onItems(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          Container(
            height: height,
            width: 200,
            color: Greens,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Row(children: [
                    Image.asset("assets/Logo/Group 33.png"),
                    const Column(children: [
                      Row(
                        children: [
                          Text(
                            "DESHI",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff00CA44),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "   MART",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        "Desh ka market",
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ]),
                  ]),
                  const SizedBox(height: 40),
                  BuildItems(
                    icon: Iconsax.shop,
                    index: 0,
                    isSelected: _selectedIndex == 0,
                    onTap: () => _onItems(0),
                    text: "Dashboard",
                  ),
                  const SizedBox(height: 20),
                  BuildItems(
                    icon: Iconsax.shopping_bag5,
                    index: 1,
                    isSelected: _selectedIndex == 1,
                    onTap: () => _onItems(1),
                    text: "Products",
                  ),
                  const SizedBox(height: 20),
                  BuildItems(
                    icon: Iconsax.element_2,
                    index: 2,
                    isSelected: _selectedIndex == 2,
                    onTap: () => _onItems(2),
                    text: "Category",
                  ),
                  const SizedBox(height: 20),
                  BuildItems(
                    icon: Icons.discount_sharp,
                    index: 3,
                    isSelected: _selectedIndex == 3,
                    onTap: () => _onItems(3),
                    text: "Coupon Code",
                  ),
                  const SizedBox(height: 20),
                  BuildItems(
                    icon: Icons.receipt_outlined,
                    index: 4,
                    isSelected: _selectedIndex == 4,
                    onTap: () => _onItems(4),
                    text: "Orders",
                  ),
                  const SizedBox(height: 20),
                  BuildItems(
                    icon: Icons.settings,
                    index: 5,
                    isSelected: _selectedIndex == 5,
                    onTap: () => _onItems(5),
                    text: "Settings",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildItems extends StatelessWidget {
  final IconData icon;
  final int index;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const BuildItems(
      {super.key,
      required this.icon,
      required this.index,
      required this.isSelected,
      required this.onTap,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isSelected ? Green : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Greens : Grey,
              size: 24,
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
