import 'package:another_stepper/another_stepper.dart';
import 'package:e_commerce_fruits_app/Utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/StepperDataList/stepper_data_list.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
          backgroundColor: Colors.green,
          title: const Text('Order Details',
              style: TextStyle(color: Colors.white)),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              const Text(
                  'Please check your order status to get the item delivered to your home'),

              /// Another Stepper
              AnotherStepper(
                stepperList: stepperData,
                barThickness: 1.9,
                verticalGap: 25,
                activeBarColor: Green,
                inActiveBarColor: Green,
                stepperDirection: Axis.vertical,
                iconHeight: 33,
                iconWidth: 33,
              )
            ],
          ),
        ),
      ),
    );
  }
}
