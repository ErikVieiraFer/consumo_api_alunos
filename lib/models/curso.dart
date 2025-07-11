// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Curso {
  int id;
  String nome;
  bool isAluno;
  Curso({
    required this.id,
    required this.nome,
    required this.isAluno,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'isAluno': isAluno,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Curso.fromMap(Map<String, dynamic> map) {
    return Curso(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      isAluno: map['isAuno'] ?? false,
    );
  }

  factory Curso.fromJson(String json) => Curso.fromMap(jsonDecode(json));
}
