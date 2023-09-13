import 'package:calculadora_imc/models/imc_result.dart';
import 'package:calculadora_imc/pages/settings_page.dart';
import 'package:calculadora_imc/utils/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculadora_imc/pages/home_page.dart';
import 'package:calculadora_imc/pages/about_page.dart';
import 'package:calculadora_imc/pages/imc_history_screen.dart';

List<IMCResult> imcHistory = [];

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => ThemeManager(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
      title: 'Calculadora de IMC',

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeManager.isDarkMode ? ThemeMode.dark : ThemeMode.light,

      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/about': (context) => const AboutPage(),
        '/settings': (context) => const SettingsPage(),
        '/history': (context) => const IMCHistoryScreen(imcHistory: []),

      },
    );
  }
}
