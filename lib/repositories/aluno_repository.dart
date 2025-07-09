import 'dart:convert';

import 'package:consumo_api_alunos/models/aluno.dart';
import 'package:http/http.dart' as http;

//CLASSE REPOSITORY - BASE DO NOSSO REPOSITORIO
class AlunoRepository {
  //CHAMADA PARA O BACKEND
  Future<List<Aluno>> buscarTodos() async {
    //RESPOSTA DO BACKEND
    final alunosResponse =
        await http.get(Uri.parse('http://localhost:8080/alunos'));

    //VEM COM O BODY, QUE É UMA STRING, E EU NÃO POSSO CHAMAR DIRETAMENTE,
    //POIS O BODY REPORESENTA MAIS DE UM ALUNO
    //TEMOS QUE FAZER A DECODIFICAÇÃO/DESSERIALIZAÇÃO DO NOSSO BACKEND
    final alunosList = jsonDecode(alunosResponse.body);

    final todosAlunos = alunosList.map<Aluno>((alunoMap) {
      return Aluno.fromMap(alunoMap);
    }).toList();
    return todosAlunos;

    // return alunosList
    //  .map<Aluno>((alunoMap) => Aluno.fromMap(alunoMap))
    //  .toList()
  }

//BUSCAR POR
  Future<Aluno> buscarPorId(int id) async {
    final alunosResponde =
        await http.get(Uri.parse('http://localhost:8080/alunos/$id'));
    return Aluno.fromJson(alunosResponde.body);
  }
}
