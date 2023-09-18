import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora_imc/models/bmi_calculator.dart';
import 'package:calculadora_imc/models/classification.dart';

void main() {
  group('BMICalculator', () {
    test('Calcula o IMC corretamente', () {
      final calculator = BMICalculator();

      // Teste com valores de peso e altura
      final bmi1 = calculator.calculateBMI(70, 1.75);
      print (bmi1);
      final bmi2 = calculator.calculateBMI(60, 1.60);
      print (bmi2);
      final bmi3 = calculator.calculateBMI(80, 1.80);
      print (bmi3);

      // Valores de IMC esperados para os valores acima
      expect(bmi1, closeTo(22.86, 0.01));
      expect(bmi2, closeTo(23.44, 0.01));
      expect(bmi3, closeTo(24.69, 0.01));
    });

    test('Lança um erro para valores inválidos', () {
      final calculator = BMICalculator();

      // Teste com valores de peso e altura inválidos (zero)
      expect(() => calculator.calculateBMI(0, 175), throwsArgumentError);
      expect(() => calculator.calculateBMI(70, 0), throwsArgumentError);
      expect(() => calculator.calculateBMI(0, 0), throwsArgumentError);
    });
  });

  group('Classification', () {
    test('Classifica o IMC corretamente', () {
      expect(Classification.classifyBMI(15), 'Magreza grave');
      expect(Classification.classifyBMI(16.5), 'Magreza moderada');
      expect(Classification.classifyBMI(18.3), 'Magreza leve');
      expect(Classification.classifyBMI(23), 'Saudável');
      expect(Classification.classifyBMI(28.5), 'Sobrepeso');
      expect(Classification.classifyBMI(33), 'Obesidade de grau I');
      expect(Classification.classifyBMI(38), 'Obesidade de grau II (severa)');
      expect(Classification.classifyBMI(42), 'Obesidade de grau III (mórbida)');
    });
  });
}
