import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:power/exceptions/htttp_exception.dart';
import 'package:power/utils/constants.dart';

import '../models/aluno.dart';

class AlunosProvider with ChangeNotifier {
  List<Aluno> _items = [];

  List<Aluno> get items => [..._items];

  int get itemsCount {
    return _items.length;
  }

  Aluno itemByIndex(int index) {
    return _items[index];
  }

  Future<void> loadAlunos() async {
    _items.clear();
    final response = await http.get(
      Uri.parse('${Constants.ALUNO_BASE_URL}.json'),
    );
    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((alunoId, alunoData) {
      DateTime dataCadastroParseado = DateTime.parse(alunoData['dataCadastro']);
      _items.add(
        Aluno(
          id: alunoId,
          nomeCompleto: alunoData['nomeCompleto'],
          dataNascimento: alunoData['dataNascimento'],
          sexo: alunoData['sexo'],
          telefone: alunoData['telefone'],
          endereco: alunoData['endereco'],
          patologia: alunoData['patologia'],
          objetivo: alunoData['objetivo'],
          acompanhamentoNutricional: alunoData['acompanhamentoNutricional'],
          dataCadastro: dataCadastroParseado,
          status: alunoData['status'],
        ),
      );
    });
    notifyListeners();
  }

  Future<void> addAluno(
      String id,
      String nomeCompleto,
      String dataNasc,
      String sexo,
      String telefone,
      String endereco,
      String patologia,
      String possuiAcompanhamento,
      String objetivo,
      DateTime dataCadastro,
      bool status) async {
    final newAluno = Aluno(
        id: "",
        nomeCompleto: nomeCompleto,
        dataNascimento: dataNasc,
        sexo: sexo,
        telefone: telefone,
        endereco: endereco,
        patologia: patologia,
        objetivo: objetivo,
        acompanhamentoNutricional: possuiAcompanhamento,
        dataCadastro: dataCadastro,
        status: status);

    final response = await http.post(
      Uri.parse('${Constants.ALUNO_BASE_URL}.json'),
      body: jsonEncode(
        {
          "nomeCompleto": newAluno.nomeCompleto,
          "dataNascimento": newAluno.dataNascimento,
          "sexo": newAluno.sexo,
          "telefone": newAluno.telefone,
          "endereco": newAluno.endereco,
          "patologia": newAluno.patologia,
          "objetivo": newAluno.objetivo,
          "acompanhamentoNutricional": newAluno.acompanhamentoNutricional,
          "dataCadastro": newAluno.dataCadastro!.toIso8601String(),
          "status": newAluno.status,
        },
      ),
    );

    final id = jsonDecode(response.body)['name'];
    _items.add(
      Aluno(
          id: id,
          nomeCompleto: newAluno.nomeCompleto,
          dataNascimento: newAluno.dataNascimento,
          sexo: newAluno.sexo,
          telefone: newAluno.telefone,
          endereco: newAluno.endereco,
          patologia: newAluno.patologia,
          objetivo: newAluno.objetivo,
          acompanhamentoNutricional: newAluno.acompanhamentoNutricional,
          dataCadastro: newAluno.dataCadastro,
          status: newAluno.status),
    );
    notifyListeners();
  }

  Future<void> updateAluno(Aluno aluno) async {
    int index = _items.indexWhere((a) => a.id == aluno.id);

    if (index >= 0) {
      await http.patch(
        Uri.parse('${Constants.ALUNO_BASE_URL}/${aluno.id}.json'),
        body: jsonEncode(
          {
            "nomeCompleto": aluno.nomeCompleto,
            "dataNascimento": aluno.dataNascimento,
            "sexo": aluno.sexo,
            "telefone": aluno.telefone,
            "endereco": aluno.endereco,
            "patologia": aluno.patologia,
            "objetivo": aluno.objetivo,
            "acompanhamentoNutricional": aluno.acompanhamentoNutricional,
            "dataCadastro": aluno.dataCadastro!.toIso8601String(),
          },
        ),
      );
      _items[index] = aluno;
      notifyListeners();
    }
  }

  Future<void> removeAluno(Aluno aluno) async {
    int index = _items.indexWhere((a) => a.id == aluno.id);

    if (index >= 0) {
      final aluno = _items[index];
      _items.remove(aluno);
      notifyListeners();

      final response = await http.delete(
        Uri.parse('${Constants.ALUNO_BASE_URL}/${aluno.id}.json'),
      );

      if (response.statusCode >= 400) {
        _items.insert(index, aluno);
        notifyListeners();
        throw HttpException(
          msg: 'Não foi possível excluir o aluno',
          statusCode: response.statusCode,
        );
      }
    }
  }
}
