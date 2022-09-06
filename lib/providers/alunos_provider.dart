import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../models/aluno.dart';

class AlunosProvider with ChangeNotifier {
  List<Aluno> _items = [];

  List<Aluno> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Aluno itemByIndex(int index) {
    return _items[index];
  }

  void addAluno(
      String nomeCompleto,
      String dataNasc,
      String sexo,
      String telefone,
      String endereco,
      String patologia,
      String possuiAcompanhamento,
      String objetivo,
      DateTime dataCadastro) {
    final newAluno = Aluno(
        id: Random().nextDouble().toString(),
        nomeCompleto: nomeCompleto,
        dataNascimento: dataNasc,
        sexo: sexo,
        telefone: telefone,
        endereco: endereco,
        patologia: patologia,
        objetivo: objetivo,
        acompanhamentoNutricional: possuiAcompanhamento,
        dataCadastro: dataCadastro,
        status: true);

    _items.add(newAluno);
    notifyListeners();
  }

  void updateAluno(Aluno aluno) {
    int index = _items.indexWhere((a) => a.id == aluno.id);

    if (index >= 0) {
      _items[index] = aluno;
      notifyListeners();
    }
  }

  void removeAluno(Aluno aluno) {
    int index = _items.indexWhere((a) => a.id == aluno.id);

    if (index >= 0) {
      _items.removeWhere((a) => a.id == aluno.id);
      notifyListeners();
    }
  }
}
