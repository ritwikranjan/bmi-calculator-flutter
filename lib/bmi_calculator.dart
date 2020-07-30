import 'dart:math';

class BMICalculator {
  final int height;
  final int weight;

  BMICalculator({this.height, this.weight});

  double calculateBMI() {
    return weight / pow(height / 100, 2);
  }

  String getBMIIndex() {
    double bmi = calculateBMI();
    return bmi.toStringAsFixed(1);
  }

  String getBMIResult() {
    double bmi = calculateBMI();
    if (bmi > 25.0) {
      return 'OVERWEIGHT';
    } else if (bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getBMIInterpratation() {
    double bmi = calculateBMI();
    if (bmi > 25) {
      return 'You should avoid running late and start running fast';
    } else if (bmi > 18.5) {
      return 'Go get a life.. huh ¯\\_(ツ)_/¯ ';
    } else {
      return 'Stop using your phone and go eat something (¬_¬)';
    }
  }
}
