import 'package:e_commerce_fruits_app/Utils/constants/colors.dart';
import 'package:e_commerce_fruits_app/views/Phone%20Auth/phoneLogin/phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_divider/styled_divider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Image.asset("assets/Logo/Group 33.png"),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        "DESHI ",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "MART",
                        style: TextStyle(
                            fontSize: 25,
                            color: Orange,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Desh ka Market",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Image.asset("assets/Icons/leaf.png"),
                Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  "Organic Groceries",
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
              ],
            ),
            StyledDivider(
              color: Colors.grey,
              height: 2,
              thickness: 2,
              lineStyle: DividerLineStyle.dotted,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Image.asset("assets/Icons/food.png"),
                Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  "Whole foods and vegitables",
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
              ],
            ),
            StyledDivider(
              color: Colors.grey,
              height: 2,
              thickness: 2,
              lineStyle: DividerLineStyle.dotted,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 22)),
                Image.asset("assets/Icons/truck.png"),
                Padding(padding: EdgeInsets.only(left: 24)),
                Text(
                  "Fast Delivery",
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
              ],
            ),
            StyledDivider(
              color: Colors.grey,
              height: 2,
              thickness: 2,
              lineStyle: DividerLineStyle.dotted,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 22)),
                Image.asset("assets/Icons/money.png"),
                Padding(padding: EdgeInsets.only(left: 24)),
                Text(
                  "East Refund and return",
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
              ],
            ),
            StyledDivider(
              color: Colors.grey,
              height: 2,
              thickness: 2,
              lineStyle: DividerLineStyle.dotted,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 22)),
                Image.asset("assets/Icons/vector (2).png"),
                Padding(padding: EdgeInsets.only(left: 25)),
                Text(
                  "Secure and Safe",
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 40),
            Positioned(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 32, 213, 38),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18)),
                  ),
                  padding: EdgeInsets.all(18),
                  height: height * 0.3,
                  width: width,
                  child: Column(
                    children: [
                      Text(
                        "Welcome  to our Store",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Get your grocery in as fast as one hours",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 60,
                        width: 250,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            onPressed: () {
                              Get.to(const PhoneScreen());
                            },
                            child: Text(
                              "Get Started",
                              style: TextStyle(fontSize: 18, color: Green),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
