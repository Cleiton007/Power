import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:power/models/pagamento_item.dart';
import 'package:power/utils/constants.dart';

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

  Future<void> loadPagamentos() async {
    _items.clear();
    final response = await http.get(
      Uri.parse('${Constants.PAGAMENTO_BASE_URL}.json'),
    );
    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((pagamentoId, pagamentoData) {
      DateTime dataPagamentoParseado =
          DateTime.parse(pagamentoData['dataPagamento']);
      DateTime dataVencimentoParseado =
          DateTime.parse(pagamentoData['dataVencimento']);
      _items.add(
        PagamentoItem(
          id: pagamentoId,
          alunoId: pagamentoData['alunoId'],
          nameAluno: pagamentoData['nameAluno'],
          status: pagamentoData['status'],
          dataPagamento: dataPagamentoParseado,
          dataVencimento: dataVencimentoParseado,
          valorPagamento: pagamentoData['valorPagamento'],
          formaPagamento: pagamentoData['formaPagamento'],
        ),
      );
    });
    notifyListeners();
  }

  Future<void> addPagamento(
    bool status,
    String valor,
    DateTime dataPagamento,
    DateTime dataVencimento,
    String alunoId,
    String nameAluno,
    String formaPagamento,
  ) async {
    final newPagamento = PagamentoItem(
      id: "",
      alunoId: alunoId,
      nameAluno: nameAluno,
      status: status,
      dataPagamento: dataPagamento,
      dataVencimento: dataVencimento,
      valorPagamento: valor,
      formaPagamento: formaPagamento,
    );

    final response = await http.post(
      Uri.parse('${Constants.PAGAMENTO_BASE_URL}.json'),
      body: jsonEncode(
        {
          "alunoId": newPagamento.alunoId,
          "nameAluno": newPagamento.nameAluno,
          "status": newPagamento.status,
          "dataPagamento": newPagamento.dataPagamento!.toIso8601String(),
          "dataVencimento": newPagamento.dataVencimento!.toIso8601String(),
          "valorPagamento": newPagamento.valorPagamento,
          "formaPagamento": newPagamento.formaPagamento,
        },
      ),
    );

    final id = jsonDecode(response.body)['name'];
    _items.add(
      PagamentoItem(
          id: id,
          alunoId: newPagamento.alunoId,
          nameAluno: newPagamento.nameAluno,
          status: newPagamento.status,
          dataPagamento: newPagamento.dataPagamento,
          dataVencimento: newPagamento.dataVencimento,
          valorPagamento: newPagamento.valorPagamento,
          formaPagamento: newPagamento.formaPagamento),
    );
    notifyListeners();
  }

  Future<void> updatePagamento(PagamentoItem pagamentoItem) async {
    int index = _items.indexWhere((p) => p.id == pagamentoItem.id);

    if (index >= 0) {
      await http.patch(
        Uri.parse('${Constants.PAGAMENTO_BASE_URL}/${pagamentoItem.id}.json'),
        body: jsonEncode(
          {
            "alunoId": pagamentoItem.alunoId,
            "nameAluno": pagamentoItem.nameAluno,
            "dataPagamento": pagamentoItem.dataPagamento!.toIso8601String(),
            "dataVencimento": pagamentoItem.dataVencimento!.toIso8601String(),
            "valorPagamento": pagamentoItem.valorPagamento,
            "formaPagamento": pagamentoItem.formaPagamento,
          },
        ),
      );
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
