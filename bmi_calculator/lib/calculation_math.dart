import 'dart:math';

class CalculationMath {
  CalculationMath({required this.height, required this.weight});

  final int height;
  final int weight;
  late double _bmi;

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if (_bmi >= 25){
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return 'Underweight';
    }
  }

   String getInterpretation(){
    if (_bmi >= 25){
      return 'You are a bit overweight, Try working out more!';
    } else if (_bmi > 18.5) {
      return "Your weight is normal. Nice Job!";
    } else {
      return 'You are a bit underweight, Try eating some more!';
    }
  }
}