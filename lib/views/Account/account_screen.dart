import 'package:e_commerce_fruits_app/Utils/constants/colors.dart';
import 'package:e_commerce_fruits_app/views/Account/order_detail_Screen.dart';
import 'package:e_commerce_fruits_app/views/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.05, top: height * 0.05),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 90,
                width: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/Logo/avatar.jpg"),
                    )),
              ),
              SizedBox(
                width: width * 0.05,
                height: height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            " Alishba Khan",
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.edit_outlined,
                            color: Green,
                          )
                        ],
                      ),
                      Text(
                        " alishbakhan579@gmail.com",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ]),
              )
            ]),
          ),
          Column(
            children: [
              const Divider(),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(left: 22)),
                  const Icon(Icons.shopping_bag_outlined),
                  Padding(padding: EdgeInsets.only(left: 24)),
                  const Text(
                    "Orders",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: width * 0.45),
                  IconButton(
                      onPressed: () {
                        Get.to(OrderDetailScreen());
                      },
                      icon: Icon(Icons.chevron_right))
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Divider(),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(left: 15)),
                  const Icon(Iconsax.personalcard),
                  Padding(padding: EdgeInsets.only(left: 0.2)),
                  const Text(
                    "My Details",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: width * 0.25),
                  const Icon(Icons.chevron_right)
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Divider(),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  const Icon(Icons.location_on_outlined),
                  Padding(padding: EdgeInsets.only(left: 24)),
                  const Text(
                    "Delivery Address",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: width * 0.20),
                  const Icon(Icons.chevron_right)
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Divider(),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(left: 22)),
                  const Icon(Icons.payment_outlined),
                  Padding(padding: EdgeInsets.only(left: 24)),
                  const Text(
                    "Payment Method",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: width * 0.20),
                  const Icon(Icons.chevron_right)
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Divider(),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(left: 22)),
                  const Icon(Icons.ad_units_sharp),
                  Padding(padding: EdgeInsets.only(left: 24)),
                  const Text(
                    "Promo Cord",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: width * 0.25),
                  const Icon(Icons.chevron_right)
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Divider(),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(left: 22)),
                  const Icon(Icons.notifications_none),
                  Padding(padding: EdgeInsets.only(left: 24)),
                  const Text(
                    "Notifications",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: width * 0.25),
                  const Icon(Icons.chevron_right)
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Divider(),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(left: 22)),
                  const Icon(Icons.help_outline_outlined),
                  Padding(padding: EdgeInsets.only(left: 24)),
                  const Text(
                    "Help",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: width * 0.45),
                  const Icon(Icons.chevron_right)
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Divider(),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(left: 22)),
                  const Icon(Iconsax.warning_2),
                  Padding(padding: EdgeInsets.only(left: 24)),
                  const Text(
                    "About",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: width * 0.45),
                  const Icon(Icons.chevron_right)
                ],
              ),
              const Divider(),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(LoginScreen());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.logout_outlined, color: Green),
                    const SizedBox(width: 60),
                    Expanded(
                        child: Text(
                      "Log Out",
                      style: TextStyle(fontSize: 20, color: Green),
                    )),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
