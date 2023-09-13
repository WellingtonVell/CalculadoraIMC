import 'package:calculadora_imc/models/imc_result.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_imc/pages/imc_history_screen.dart';

class MyDrawer extends StatelessWidget {
  final List<IMCResult> imcHistory;

  const MyDrawer({Key? key, required this.imcHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Colors.deepPurple, // Cor de fundo do cabeçalho
            padding: const EdgeInsets.symmetric(vertical: 33.0), // Ajuste do espaçamento vertical
            child: const Center(
              child: Text(
                'Opções do Menu',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white, // Cor do texto
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Histórico'),
            onTap: () {
              Navigator.pop(context); // Fecha o Drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IMCHistoryScreen(imcHistory: imcHistory),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.pop(context); // Fecha o Drawer
              Navigator.pushNamed(context, '/settings'); // Abre a página de configurações
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Sobre'),
            onTap: () {
              Navigator.pop(context); // Fecha o Drawer
              Navigator.pushNamed(context, '/about'); // Abre a página "Sobre"
            },
          ),
        ],
      ),
    );
  }
}
