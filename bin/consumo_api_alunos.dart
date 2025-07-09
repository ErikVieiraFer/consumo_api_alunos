import 'package:consumo_api_alunos/repositories/aluno_repository.dart';

Future<void> main() async {
  final alunoRepository = AlunoRepository();

  final alunos = await alunoRepository.buscarTodos();

  print(alunos);

  final aluno = await alunoRepository.buscarPorId(0);
  print(aluno.nome);
  print(aluno.nomeCursos);
  print('Cursos ADF:');
  for (var curso in aluno.cursos) {
    print(
        '${curso.nome}: ${aluno.nome} é aluno: ${(curso.isAluno ? 'sim' : 'não')}');
  }
}
