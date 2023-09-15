import 'package:flutter/material.dart';

// Classe que define uma barra de aplicativos personalizada
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title; // Título da barra de aplicativos

  const MyAppBar({Key? key, this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple, // Define a cor de fundo da barra de aplicativo
      title: title != null ? Text(title!) : null, // Define o título da barra (se fornecido)
    );
  }
}
