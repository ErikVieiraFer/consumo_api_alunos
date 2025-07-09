// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:consumo_api_alunos/models/curso.dart';
import 'package:consumo_api_alunos/models/endereco.dart';

class Aluno {
  int id;
  String nome;
  int? idade;
  List<String> nomeCursos;
  List<Curso> cursos;
  Endereco endereco;
  Aluno({
    required this.id,
    required this.nome,
    this.idade,
    required this.nomeCursos,
    required this.cursos,
    required this.endereco,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'idade': idade,
      'nomeCursos': nomeCursos,
      'cursos': cursos.map((curso) => curso.toMap()).toList(),
      'endereco': endereco.toMap(),
    };

    if (idade != null) {
      map['idade'] = idade;
    }
    return map;
  }

  String toJson() => jsonEncode(toMap);

//!CONVERSÕES IMPORTANTES
  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      idade: map['idade'],

      //List<dynamic> não é uma lista de List<String>
      nomeCursos: List<String>.from((map['nomeCursos'] ?? <String>[])),
      // nomeCursos: map['nomeCursos'].cast<String>(),
      endereco: Endereco.fromMap(map['endereco'] ?? <String, dynamic>{}),
      cursos: map['curso']
              ?.map<Curso>((cursoMap) => Curso.fromMap(cursoMap))
              .toList() ??
          <Curso>[],
    );
  }

  factory Aluno.fromJson(String json) => Aluno.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Aluno: $nome($id)';
  }
}
