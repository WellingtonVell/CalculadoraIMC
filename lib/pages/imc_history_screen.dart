import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/imc_result.dart';

class IMCHistoryScreen extends StatelessWidget {
  final List<IMCResult> imcHistory;

  const IMCHistoryScreen({super.key, required this.imcHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de IMC'),
      ),
      body: ListView.builder(
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