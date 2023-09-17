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
  
  testWidgets('Teste de cálculo de IMC - Magreza moderada', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final weightField = find.byKey(const Key('weightField'));
    final heightField = find.byKey(const Key('heightField'));

    await tester.enterText(weightField, '50');
    await tester.enterText(heightField, '175'); 
    final calculateButton = find.text('Calcular IMC');
    await tester.tap(calculateButton);
    await tester.pump();

    expect(find.text('Seu IMC é: 16.33'), findsOneWidget);
    expect(find.text('Magreza moderada'), findsOneWidget);
  });

  testWidgets('Teste de cálculo de IMC - Magreza leve', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final weightField = find.byKey(const Key('weightField'));
    final heightField = find.byKey(const Key('heightField'));

    await tester.enterText(weightField, '55');
    await tester.enterText(heightField, '175'); 
    final calculateButton = find.text('Calcular IMC');
    await tester.tap(calculateButton);
    await tester.pump();

    expect(find.text('Seu IMC é: 17.96'), findsOneWidget);
    expect(find.text('Magreza leve'), findsOneWidget);
  });

  testWidgets('Teste de cálculo de IMC - Saudável', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final weightField = find.byKey(const Key('weightField'));
    final heightField = find.byKey(const Key('heightField'));

    await tester.enterText(weightField, '60');
    await tester.enterText(heightField, '175'); 
    final calculateButton = find.text('Calcular IMC');
    await tester.tap(calculateButton);
    await tester.pump();

    expect(find.text('Seu IMC é: 19.59'), findsOneWidget);
    expect(find.text('Saudável'), findsOneWidget);
  });

  testWidgets('Teste de cálculo de IMC - Sobrepeso', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final weightField = find.byKey(const Key('weightField'));
    final heightField = find.byKey(const Key('heightField'));

    await tester.enterText(weightField, '80');
    await tester.enterText(heightField, '175'); 
    final calculateButton = find.text('Calcular IMC');
    await tester.tap(calculateButton);
    await tester.pump();

    expect(find.text('Seu IMC é: 26.12'), findsOneWidget);
    expect(find.text('Sobrepeso'), findsOneWidget);
  });

  testWidgets('Teste de cálculo de IMC - Obesidade de grau I', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final weightField = find.byKey(const Key('weightField'));
    final heightField = find.byKey(const Key('heightField'));

    await tester.enterText(weightField, '100');
    await tester.enterText(heightField, '175'); 
    final calculateButton = find.text('Calcular IMC');
    await tester.tap(calculateButton);
    await tester.pump();

    expect(find.text('Seu IMC é: 32.65'), findsOneWidget);
    expect(find.text('Obesidade de grau I'), findsOneWidget);
  });

  testWidgets('Teste de cálculo de IMC - Obesidade de grau II (severa)', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final weightField = find.byKey(const Key('weightField'));
    final heightField = find.byKey(const Key('heightField'));

    await tester.enterText(weightField, '120');
    await tester.enterText(heightField, '175'); 
    final calculateButton = find.text('Calcular IMC');
    await tester.tap(calculateButton);
    await tester.pump();

    expect(find.text('Seu IMC é: 39.18'), findsOneWidget);
    expect(find.text('Obesidade de grau II (severa)'), findsOneWidget);
  });

  testWidgets('Teste de cálculo de IMC - Obesidade de grau III (mórbida)', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final weightField = find.byKey(const Key('weightField'));
    final heightField = find.byKey(const Key('heightField'));

    await tester.enterText(weightField, '160');
    await tester.enterText(heightField, '175'); 
    final calculateButton = find.text('Calcular IMC');
    await tester.tap(calculateButton);
    await tester.pump();

    expect(find.text('Seu IMC é: 52.24'), findsOneWidget);
    expect(find.text('Obesidade de grau III (mórbida)'), findsOneWidget);
  });
}