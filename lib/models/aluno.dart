//import 'package:power/models/perimetria.dart';

class Aluno {
  String? id;
  String? nomeCompleto;
  String? dataNascimento;
  String? telefone;
  String? endereco;
  String? patologia;
  String? objetivo;
  String? acompanhamentoNutricional;
  //final Perimetria perimetria;
  bool status = false;

  Aluno(
      {required this.id,
      required this.nomeCompleto,
      required this.dataNascimento,
      required this.telefone,
      required this.endereco,
      required this.patologia,
      required this.objetivo,
      required this.acompanhamentoNutricional,
      //required this.perimetria,
      required this.status});

  String? get Id {
    return id;
  }

  void setNome(String novoNome) {
    nomeCompleto = novoNome;
  }

  void setDataNascimento(String novaDataNascimento) {
    dataNascimento = novaDataNascimento;
  }

  void setTelefone(String novoTelefone) {
    telefone = novoTelefone;
  }

  void setEndereco(String novoEndereco) {
    endereco = novoEndereco;
  }

  void setPatologia(String novaPatologia) {
    patologia = novaPatologia;
  }

  void setObjetivo(String novoObjetivo) {
    objetivo = novoObjetivo;
  }

  void setAcompanhamentoNutricional(String novoAcompanhamento) {
    acompanhamentoNutricional = novoAcompanhamento;
  }
}
