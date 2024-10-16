import 'package:e_commerce_fruits_app/Utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              width: width,
              color: Greens,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        "Create New",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      )),
                  SizedBox(width: 15),
                  Icon(Icons.notifications),
                  SizedBox(width: 15),
                  CircleAvatar(
                    backgroundColor: green,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  icon: Icons.shopping_cart_outlined,
                  text: 'Total Orders',
                  value: '23545',
                  color: green,
                ),
                Card(
                  icon: Icons.repeat_sharp,
                  text: 'Pending Orders',
                  value: '23545',
                  color: Colors.red,
                ),
                Card(
                  icon: Icons.fire_truck_outlined,
                  text: 'Processing Orders',
                  value: '23545',
                  color: Colors.blue,
                ),
                Card(
                  icon: Icons.check,
                  text: 'Complete Orders',
                  value: '23545',
                  color: green,
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Recent Orders",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String text;
  final String value;
  final IconData icon;
  final Color color;
  const Card(
      {super.key,
      required this.text,
      required this.value,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.4),
              child: Center(
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(color: Grey.withOpacity(0.8), fontSize: 13),
                ),
                Text(
                  value,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )
              ],
            ),
          ],
        ));
  }
}
