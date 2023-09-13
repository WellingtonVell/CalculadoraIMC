// bmi_calculator.dart

class BMICalculator {
  double calculateBMI(double weight, double height) {
    if (weight <= 0 || height <= 0) {
      throw ArgumentError('Valores inválidos. Peso e altura devem ser maiores que zero.');
    }

    final double bmi = weight / (height * height);
    return bmi;
  }
}
