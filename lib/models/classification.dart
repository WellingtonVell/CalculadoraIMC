// Classe que lida com a classificação do IMC
import 'package:flutter/material.dart';

class Classification {
  // Método estático que classifica o IMC com base em seu valor
  static String classifyBMI(double bmi) {
    if (bmi < 16) {
      return 'Magreza grave';
    } else if (bmi < 17) {
      return 'Magreza moderada';
    } else if (bmi < 18.5) {
      return 'Magreza leve';
    } else if (bmi < 25) {
      return 'Saudável';
    } else if (bmi < 30) {
      return 'Sobrepeso';
    } else if (bmi < 35) {
      return 'Obesidade de grau I';
    } else if (bmi < 40) {
      return 'Obesidade de grau II (severa)';
    } else {
      return 'Obesidade de grau III (mórbida)';
    }
  }

  static Color getColorForResult(String classification) {
    switch (classification) {
      case 'Magreza grave':
        return Colors.red;
      case 'Magreza moderada':
        return Colors.orange;
      case 'Magreza leve':
        return Colors.yellow;
      case 'Saudável':
        return Colors.green;
      case 'Sobrepeso':
        return Colors.amber;
      case 'Obesidade de grau I':
        return Colors.orange;
      case 'Obesidade de grau II (severa)':
        return Colors.red;
      case 'Obesidade de grau III (mórbida)':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
