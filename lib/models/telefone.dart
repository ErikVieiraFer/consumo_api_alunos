import 'dart:convert';

class Telefone {
  int ddd;
  String telefone;
  Telefone({
    required this.ddd,
    required this.telefone,
  });

  //! PASSO 1: toMap()
  //metodo que o nosso objeto telefone e transforma em um Objeto <String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'telefone': telefone,
    };
  }

  //! PASSO 2: tojson
  //metodo que pega um Map <String, dynamic> e transforma em um json
  //pelo pacote dart:convert (jsonEncode)

  String toJson() => jsonEncode(toMap());

  //Passo 2 da deserialização
  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(
      ddd: map['ddd'] ?? 0,
      telefone: map['telefone'] ?? '',
    );
  }

  //Passo 1 da serialização
  factory Telefone.fromJson(String json) => Telefone.fromMap(jsonDecode(json));

  // REFERENCIA DE LEITURA: https://docs.flutter.dev/data-and-backend/serialization/json
}
