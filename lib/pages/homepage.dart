import 'package:calculadora_imc/pages/imc_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calculadora_imc/models/imc_result.dart';

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

  void calculateBMI() {
    String weightText = weightController.text;
    String heightText = heightController.text;

    try {
      double weight = double.parse(weightText);
      double height = double.parse(heightText) / 100;

      if (weight <= 0 || height <= 0) {
        throw Exception(
            "Valores inválidos. Peso e altura devem ser maiores que zero.");
      }

      double bmi = weight / (height * height);

      String classification = '';
      if (bmi < 16) {
        classification = 'Magreza grave';
      } else if (bmi < 17) {
        classification = 'Magreza moderada';
      } else if (bmi < 18.5) {
        classification = 'Magreza leve';
      } else if (bmi < 25) {
        classification = 'Saudável';
      } else if (bmi < 30) {
        classification = 'Sobrepeso';
      } else if (bmi < 35) {
        classification = 'Obesidade de grau I';
      } else if (bmi < 40) {
        classification = 'Obesidade de grau II (severa)';
      } else {
        classification = 'Obesidade de grau III (mórbida)';
      }

      setState(() {
        _imc = bmi;
        _classification = classification;
        _errorMessage = '';
      });

      final result = IMCResult(
          imc: bmi, classification: classification, date: DateTime.now());
      imcHistory.add(result);
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro'),
            content: const Text(
                'Valores inválidos. Certifique-se de que peso e altura sejam números válidos.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Opções do Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Histórico'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            IMCHistoryScreen(imcHistory: imcHistory)));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.calculate,
              size: 100.0,
              color: Colors.deepPurple,
            ),
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
