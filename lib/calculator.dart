import 'dart:math';

class CalculatorBrian {
  CalculatorBrian({required this.height, required  this.weight});

  final int height;
  final int weight;
  double bmii=0; // Initialize BMI with a default value of 0.0

  String calculateBMI() {
    bmii = weight / pow(height / 100, 2);

    return bmii.toStringAsFixed(1);
  }
  

  String getResult() {
    if (bmii >= 25) {
      return 'Overweight';
    } else if (bmii > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (bmii >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmii > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have lower than normal body weight. You can eat a bit more.';
    }
  }
}
