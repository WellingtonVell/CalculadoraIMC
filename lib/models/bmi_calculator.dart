// Classe que lida com o cálculo do IMC
class BMICalculator {
  // Método que calcula o IMC com base no peso e altura fornecidos
  double calculateBMI(double weight, double height) {
    // Verifica se os valores de peso e altura são válidos
    if (weight <= 0 || height <= 0) {
      throw ArgumentError('Valores inválidos. Peso e altura devem ser maiores que zero.');
    }

    // Fórmula do IMC: peso (kg) / (altura (m) * altura (m))
    final double bmi = weight / (height * height);

    // Retorna o valor calculado do IMC
    return bmi;
  }
}
