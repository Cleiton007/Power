//import 'package:power/models/perimetria.dart';

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:power/utils/constants.dart';

class Aluno with ChangeNotifier {
  String? id;
  String? nomeCompleto;
  String? dataNascimento;
  String? sexo;
  String? telefone;
  String? endereco;
  String? patologia;
  String? objetivo;
  String? acompanhamentoNutricional;
  DateTime? dataCadastro;
  //final Perimetria perimetria;
  bool status = false;

  Aluno(
      {required this.id,
      required this.nomeCompleto,
      required this.dataNascimento,
      required this.sexo,
      required this.telefone,
      required this.endereco,
      required this.patologia,
      required this.objetivo,
      required this.acompanhamentoNutricional,
      required this.dataCadastro,
      //required this.perimetria,
      required this.status});

  void setNome(String novoNome) {
    nomeCompleto = novoNome;
  }

  void setDataNascimento(String novaDataNascimento) {
    dataNascimento = novaDataNascimento;
  }

  void setSexo(String novoSexo) {
    sexo = novoSexo;
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

  void setDataCadastro(DateTime novaData) {
    dataCadastro = novaData;
  }

  void setStatus(bool newStatus) {
    status = newStatus;
  }

  void _toggleStatus() {
    status = !status;
    notifyListeners();
  }

  Future<void> toggleStatus() async {
    _toggleStatus();

    final response = await http.patch(
      Uri.parse('${Constants.ALUNO_BASE_URL}/$id.json'),
      body: jsonEncode({"status": status}),
    );

    if (response.statusCode >= 400) {
      _toggleStatus();
    }
  }
}
