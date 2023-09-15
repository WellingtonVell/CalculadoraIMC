import 'package:flutter/material.dart';
import 'package:calculadora_imc/pages/settings_page.dart';
import 'package:calculadora_imc/utils/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:calculadora_imc/pages/home_page.dart';
import 'package:calculadora_imc/pages/about_page.dart';
import 'package:calculadora_imc/pages/history_page.dart';

// Lista vazia para armazenar histórico de resultados do IMC
List<Map<String, dynamic>> imcHistory = [];

void main() {
  runApp(
    // Configuração do provider para gerenciar o tema do aplicativo
    ChangeNotifierProvider(
      create: (context) => ThemeManager(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
      title: 'Calculadora de IMC',

      // Temas claro e escuro do aplicativo
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeManager.isDarkMode ? ThemeMode.dark : ThemeMode.light,

      initialRoute: '/', // Rota inicial do aplicativo
      routes: {
        '/': (context) => MyHomePage(imcHistory: imcHistory),
        '/about': (context) => const AboutPage(), // Página "Sobre"
        '/settings': (context) => const SettingsPage(), // Página de configurações
        '/history': (context) => IMCHistoryScreen(imcHistory: imcHistory), // Página de histórico
      },
    );
  }
}
