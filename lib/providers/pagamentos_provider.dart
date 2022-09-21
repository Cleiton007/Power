import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:power/models/pagamento_item.dart';

class PagamentosProvider with ChangeNotifier {
  List<PagamentoItem> _items = [];

  List<PagamentoItem> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  PagamentoItem itemByIndex(int index) {
    return _items[index];
  }

  void addPagamento(
    bool status,
    String valor,
    DateTime dataPagamento,
    DateTime dataVencimento,
    String alunoId,
    String nameAluno,
    String formaPagamento,
  ) {
    final newPagamento = PagamentoItem(
        id: Random().nextInt(4).toString(),
        alunoId: alunoId,
        nameAluno: nameAluno,
        status: status,
        dataPagamento: dataPagamento,
        dataVencimento: dataVencimento,
        valorPagamento: valor,
        formaPagamento: formaPagamento);

    _items.add(newPagamento);
    notifyListeners();
  }

  void updatePagamento(PagamentoItem pagamentoItem) {
    int index = _items.indexWhere((p) => p.id == pagamentoItem.id);

    if (index >= 0) {
      _items[index] = pagamentoItem;
      notifyListeners();
    }
  }

  void removePagamento(PagamentoItem pagamentoItem) {
    int index = _items.indexWhere((p) => p.id == pagamentoItem.id);

    if (index >= 0) {
      _items.removeWhere((p) => p.id == pagamentoItem.id);
      notifyListeners();
    }
  }
}
