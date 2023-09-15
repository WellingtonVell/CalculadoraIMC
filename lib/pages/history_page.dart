import 'package:calculadora_imc/models/imc_result.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/app_bar.dart';
import '../models/classification.dart';
import '../data/imc_database_helper.dart';

class IMCHistoryScreen extends StatefulWidget {
  const IMCHistoryScreen(
      {Key? key, required List<Map<String, dynamic>> imcHistory})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IMCHistoryScreenState createState() => _IMCHistoryScreenState();
}

class _IMCHistoryScreenState extends State<IMCHistoryScreen> {
  List<IMCResult> imcHistory = [];

  @override
  void initState() {
    super.initState();
    // Crie uma instância do IMCDatabaseHelper
    final databaseHelper = IMCDatabaseHelper();

    // Use o método para listar os dados do banco de dados
    databaseHelper.listarDadosIMC().then((resultados) {
      setState(() {
        // Converta os resultados do banco de dados em objetos IMCResult
        imcHistory = resultados;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Histórico de IMC',
      ),
      body: imcHistory.isEmpty
          ? const Center(
              child: Text(
                'Nenhum registro de IMC disponível.',
              ),
            )
          : ListView.builder(
              itemCount: imcHistory.length,
              itemBuilder: (context, index) {
                final result = imcHistory[index];
                final classification = Classification.classifyBMI(result.imc);
                final color = Classification.getColorForResult(classification);

                return Container(
  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  color: color,
  child: ListTile(
    //title: Text('Nome: ${result.name}'),
    subtitle: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'IMC: ${result.imc.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Classificação: $classification',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        Text(
          DateFormat('dd/MM/yy').format(result.date),
          style: const TextStyle(
            fontSize: 14.0,
          ),
        ),
      ],
    ),
  ),
);

              },
            ),
    );
  }
}
