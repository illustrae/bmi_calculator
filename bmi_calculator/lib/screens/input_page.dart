import 'package:bmi_calculator/components/calculation_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_card.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/rounded_button.dart';
import 'package:bmi_calculator/calculation_math.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR', style: kTitleBarTextStyle),
        centerTitle: true,
        shadowColor: Colors.black38,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kCardPressed
                        : kCardColor,
                    cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kCardPressed
                        : kCardColor,
                    cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: const Color(0xFF5ac88d),
                      thumbColor: const Color(0xFFed648e),
                      overlayColor: const Color(0x3d5ac88d),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 25.0),
                      trackHeight: 2.0,
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 245.0,
                        inactiveColor: const Color(0xFFc0c0c0),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        /*        SizedBox(height: 5.0),     */
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            const SizedBox(
                              width: 8.0,
                            ),
                            RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        /*        SizedBox(height: 5.0),     */
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            const SizedBox(
                              width: 8.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculationButton(
            buttonTitle: "Calculate",
            onTap: () {
              CalculationMath calc =
                  CalculationMath(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    interpretationText: calc.getInterpretation(),
                    //functions that are coming from calculation_math.dart CalculationMath Class.
                  ),
                ),
              );
            },
          ),
        ], //<Widget>
      ),
    );
  }
}
