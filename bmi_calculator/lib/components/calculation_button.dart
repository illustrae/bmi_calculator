

import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';


class CalculationButton extends StatelessWidget {
  const CalculationButton({super.key, 
    required this.onTap, required this.buttonTitle
  });

    final void Function() onTap;
    final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: const Color.fromARGB(255, 255, 164, 84),
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child:  Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(buttonTitle, style: kLargeButtonText),
            )),
      ),
    );
  }
}
