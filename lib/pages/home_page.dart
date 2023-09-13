import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calculadora_imc/models/imc_result.dart';
import 'package:calculadora_imc/widgets/app_bar.dart';
import 'package:calculadora_imc/widgets/drawer.dart';
import 'package:calculadora_imc/models/value_error.dart';
import 'package:calculadora_imc/models/bmi_calculator.dart';
import 'package:calculadora_imc/models/classification.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  double _imc = 0.0;
  String _classification = '';
  String _errorMessage = '';
  List<IMCResult> imcHistory = [];
  
  final BMICalculator bmiCalculator = BMICalculator(); // Instancia o modelo BMICalculator
  final Classification classification = Classification(); // Instancia a classe Classification

  void calculateBMI() {
    String weightText = weightController.text;
    String heightText = heightController.text;
    
    try {
      double weight = double.parse(weightText);
      double height = double.parse(heightText) / 100;

      double bmi = bmiCalculator.calculateBMI(weight, height); // Usa o modelo para calcular o BMI

      String classification = Classification.classifyBMI(bmi); // Usa a instância da classe Classification

      final result = IMCResult(
          imc: bmi, classification: classification, date: DateTime.now());
      setState(() {
        _imc = bmi;
        _classification = classification;
        _errorMessage = '';
      });
      imcHistory.add(result);
    } catch (e) {
      ValueError.show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Calculadora IMC'),
      drawer: MyDrawer(
        imcHistory: imcHistory,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(Icons.calculate, size: 100.0, color: Colors.deepPurple),
            const SizedBox(height: 16.0),
            const Text(
              'Calculadora de Índice de Massa Corporal',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            const Text('Informe seu peso (kg):',
                style: TextStyle(fontSize: 16.0)),
            TextField(
              key: const Key('weightField'),
              controller: weightController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                    RegExp(r'^\d+\.?\d{0,2}')) // impedir utilização de letras
              ],
              decoration: const InputDecoration(
                hintText: 'Exemplo: 70.5',
                labelText: 'Peso (kg)',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Informe sua altura (cm):',
                style: TextStyle(fontSize: 16.0)),
            TextField(
              key: const Key('heightField'),
              controller: heightController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                    RegExp(r'^\d+\.?\d{0,2}')) // impedir utilização de letras
              ],
              decoration: const InputDecoration(
                hintText: 'Exemplo: 175',
                labelText: 'Altura (cm)',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: calculateBMI,
              style: ElevatedButton.styleFrom(
                // ignore: deprecated_member_use
                primary: Colors.deepPurple,
              ),
              child:
                  const Text('Calcular IMC', style: TextStyle(fontSize: 18.0)),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Seu IMC é: ${_imc.toStringAsFixed(2)}',
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            Text(
              _classification,
              style: const TextStyle(fontSize: 38.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            Text(
              _errorMessage,
              style: const TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
