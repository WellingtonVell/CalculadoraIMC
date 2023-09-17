class IMCResult {
  int id;
  final String name;
  final double imc;
  final String classification;
  final DateTime date;

  IMCResult({
    this.id = 0,
    required this.name,
    required this.imc,
    required this.classification,
    required this.date,
  });

  // Método para criar uma instância de IMCResult a partir de um mapa (Map)
  factory IMCResult.fromMap(Map<String, dynamic> map) {
    return IMCResult(
      id: map['id'],
      name: map['name'],
      imc: map['imc'],
      classification: map['classification'],
      date: DateTime.parse(map['date']),
    );
  }

  // Método para converter uma instância de IMCResult em um mapa (Map)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imc': imc,
      'classification': classification,
      'date': date.toIso8601String(),
    };
  }

Map<String, dynamic> toInsert() {
    return {
      'name': name,
      'imc': imc,
      'classification': classification,
      'date': date.toIso8601String(),
    };
  }
}
