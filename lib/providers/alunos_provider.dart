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
      String telefone,
      String endereco,
      String patologia,
      String possuiAcompanhamento,
      String objetivo) {
    final newAluno = Aluno(
        id: Random().nextInt(4).toString(),
        nomeCompleto: nomeCompleto,
        dataNascimento: dataNasc,
        telefone: telefone,
        endereco: endereco,
        patologia: patologia,
        objetivo: objetivo,
        acompanhamentoNutricional: possuiAcompanhamento,
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
