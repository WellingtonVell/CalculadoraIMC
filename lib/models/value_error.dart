import 'package:flutter/material.dart';

// Classe que exibe um diálogo de erro para valores inválidos
class ValueError {
  // Método estático para mostrar o diálogo de erro
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'), // Título do diálogo de erro
          content: const Text(
              'Valores inválidos. Certifique-se de que peso e altura sejam números válidos.'), // Mensagem de erro
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo ao pressionar o botão "OK"
              },
              child: const Text('OK'), // Texto do botão "OK"
            ),
          ],
        );
      },
    );
  }
}