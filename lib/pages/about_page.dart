import 'package:calculadora_imc/widgets/app_bar.dart';
import 'package:flutter/material.dart';

// Página "Sobre o Aplicativo"
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: 'Sobre o Aplicativo'), // Barra de aplicativos com título "Sobre o Aplicativo"
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Sobre o Aplicativo',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'Este é um aplicativo de Calculadora de Índice de Massa Corporal (IMC) desenvolvido como parte dos desafios do Bootcamp Santander.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'O objetivo deste aplicativo é fornecer uma ferramenta simples para calcular o IMC com base em seu peso e altura. Ele também permite que você acompanhe seu histórico de IMC ao longo do tempo.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Por favor, note que este aplicativo foi criado apenas para fins de aprendizado e prática de desenvolvimento com o Flutter.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
