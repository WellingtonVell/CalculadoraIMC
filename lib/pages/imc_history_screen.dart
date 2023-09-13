import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calculadora_imc/widgets/app_bar.dart';
import '../models/imc_result.dart';

class IMCHistoryScreen extends StatelessWidget {
  final List<IMCResult> imcHistory;

  const IMCHistoryScreen({super.key, required this.imcHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Histórico de IMC'),
      body: imcHistory.isEmpty
          ? const Center(
              child: Text('Nenhum registro de IMC disponível.'),
            )
          : ListView.builder(
              itemCount: imcHistory.length,
              itemBuilder: (context, index) {
                final result = imcHistory[index];
                return ListTile(
                  title: Text('IMC: ${result.imc.toStringAsFixed(2)}'),
                  subtitle: Text('Classificação: ${result.classification}'),
                  trailing: Text(DateFormat('dd/MM/yy').format(result.date)),
                );
              },
            ),
    );
  }
}
