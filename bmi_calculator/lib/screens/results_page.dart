import 'package:bmi_calculator/components/calculation_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretationText});

  final String bmiResult;
  final String resultText;
  final String interpretationText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR', style: kTitleBarTextStyle),
        centerTitle: true,
        shadowColor: Colors.black38,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
           Expanded(
              flex: 7,
              child: ReusableCard(
                color: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: kBmiNormal,
                    ),
                    Text(
                      bmiResult,
                      style: kBmiTextStyle,
                    ),
                    Text(
                      interpretationText,
                      style: kTitleBarTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
          CalculationButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
