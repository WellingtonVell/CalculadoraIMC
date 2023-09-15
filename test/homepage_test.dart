import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora_imc/main.dart'; // Importe a classe principal do seu aplicativo
import 'package:calculadora_imc/data/imc_database_helper.dart';

void main() {
  late IMCDatabaseHelper dbHelper;

  setUp(() async {
    // Inicialize o banco de dados em memória para os testes
    dbHelper = IMCDatabaseHelper();
    await dbHelper.initDatabase();
  });

  tearDown(() async {
    // Feche o banco de dados após os testes
    await dbHelper.closeDatabase();
  });

  testWidgets('Teste de cálculo de IMC - Magreza grave', (WidgetTester tester) async {
    // Inicie o aplicativo
    await tester.pumpWidget(const MyApp());

    // Encontre os campos de entrada de peso e altura
    final weightField = find.byKey(const Key('weightField'));
    final heightField = find.byKey(const Key('heightField'));

    // Insira valores válidos nos campos de entrada
    await tester.enterText(weightField, '45'); // Magreza grave
    await tester.enterText(heightField, '175');

    // Encontre o botão de cálculo e pressione-o
    final calculateButton = find.text('Calcular IMC');
    await tester.tap(calculateButton);
    await tester.pumpAndSettle();

    // Verifique se o resultado do IMC é exibido
    expect(find.text('Seu IMC é: 14.69'), findsOneWidget);

    // Verifique se a classificação é exibida
    expect(find.text('Magreza grave'), findsOneWidget);
  });

  // Adicione mais testes conforme necessário
}
