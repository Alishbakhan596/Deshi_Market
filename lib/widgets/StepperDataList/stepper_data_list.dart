import 'package:another_stepper/dto/stepper_data.dart';
import 'package:e_commerce_fruits_app/Utils/constants/colors.dart';
import 'package:flutter/material.dart';

List<StepperData> stepperData = [
  StepperData(
      title: StepperText('Order Confirmed',
          textStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      subtitle: StepperText('Your order has been placed',
          textStyle: TextStyle(fontSize: 14, color: Grey)),
      iconWidget: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: const Icon(
          Icons.check_circle_rounded,
          color: Colors.white,
          size: 20,
        ),
      )),

  StepperData(
      title: StepperText('Prepared',
          textStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      subtitle: StepperText('Your order has been prepared'),
      iconWidget: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: const Icon(
          Icons.check_circle_rounded,
          color: Colors.white,
          size: 20,
        ),
      )),

  StepperData(
      title: StepperText('On the way',
          textStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      subtitle: StepperText(
          'our delivery executive is on the way in deliver your item'),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.lightGreen,
          // border: Border.all(color: AColors.primaryLight),
          shape: BoxShape.circle,
        ),
        child: const CircleAvatar(radius: 5, backgroundColor: Colors.white),
      )),

  /// final  data
  StepperData(
      title: StepperText('delivered ✅',
          textStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      iconWidget: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Stack(
          children: [
            const Center(
              child: Icon(
                Icons.history_outlined,
                color: Colors.green,
                size: 25,
              ),
            ),
          ],
        ),
      )),
];
