import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// Classe que gerencia o tema do aplicativo
class ThemeManager extends ChangeNotifier {
  bool _isDarkMode = false; // Variável para rastrear o modo escuro

  // Getter para verificar se o modo escuro está ativado
  bool get isDarkMode => _isDarkMode;

  // Método para alternar entre o tema claro e escuro
  void toggleTheme() {
    _isDarkMode = !_isDarkMode; // Inverte o estado do modo escuro
    notifyListeners(); // Notifica os widgets sobre a mudança no tema
  }
}
