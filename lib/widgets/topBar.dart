import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/styles/colors.dart';

List<Widget> topBar({
  required int currentStep,
  required void Function(int step) setStep,
  required PageController controller,
}) {
  return [
    LinearProgressIndicator(
      value: currentStep / 3, //  0.5 for step 1, 1.0 for step 2
      backgroundColor: Colors.grey[300],
      color: MyColors.darkPurple,
    ),
    Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => {controller.jumpToPage(0), setStep(1)},
            child: Column(
              children: [
                Icon(
                  Icons.looks_one_rounded,
                  color: currentStep >= 1 ? MyColors.darkPurple : Colors.grey,
                ),
                Text(
                  "Quick Sign Up",
                  style: TextStyle(
                    color: currentStep >= 1 ? MyColors.darkPurple : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => {controller.jumpToPage(1), setStep(2)},
            child: Column(
              children: [
                Icon(
                  Icons.looks_two_rounded,
                  color: currentStep >= 2 ? MyColors.darkPurple : Colors.grey,
                ),
                Text(
                  "Verify Email",
                  style: TextStyle(
                    color: currentStep >= 2 ? MyColors.darkPurple : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => {controller.jumpToPage(1), setStep(2)},
            child: Column(
              children: [
                Icon(
                  Icons.three_g_mobiledata,
                  color: currentStep >= 2 ? MyColors.darkPurple : Colors.grey,
                ),
                Text(
                  "Set home and work",
                  style: TextStyle(
                    color: currentStep >= 2 ? MyColors.darkPurple : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ];
}
