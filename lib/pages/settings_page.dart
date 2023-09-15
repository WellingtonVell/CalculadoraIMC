import 'package:calculadora_imc/utils/theme_manager.dart';
import 'package:calculadora_imc/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Página de configurações do aplicativo
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: const MyAppBar(
          title:
              'Configurações'), // Barra de aplicativos com título "Configurações"
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20.0),
          ListTile(
            title: const Text(
              'Modo Escuro',
              style: TextStyle(fontSize: 18.0),
            ), // Título da opção de modo escuro
            trailing: Switch(
              value: themeManager
                  .isDarkMode, // Valor do switch com base no estado atual do modo escuro
              onChanged: (value) {
                themeManager
                    .toggleTheme(); // Altera o tema quando o switch é alterado
              },
            ),
          ),
        ],
      ),
    );
  }
}
