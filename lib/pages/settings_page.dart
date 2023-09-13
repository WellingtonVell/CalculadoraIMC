import 'package:calculadora_imc/utils/theme_manager.dart';
import 'package:calculadora_imc/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: const MyAppBar(title: 'Configurações'),
      body: Column(
        children: [
          ListTile(
            title: const Text('Modo Escuro'),
            trailing: Switch(
              value: themeManager.isDarkMode,
              onChanged: (value) {
                themeManager.toggleTheme();
              },
            ),
          ),
        ],
      ),
    );
  }
}


/*
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Configurações'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Modo Escuro',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Ativar Modo Escuro'),
                const Spacer(),
                Switch(
                  value: _isDarkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isDarkModeEnabled = value;
                      Provider.of<ThemeManager>(context, listen: false).toggleTheme();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/