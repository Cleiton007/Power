import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:power/models/pagamento_item.dart';
import 'package:power/providers/pagamentos_provider.dart';
import 'package:provider/provider.dart';

class PagamentosUpdateFormScreen extends StatefulWidget {
  const PagamentosUpdateFormScreen({Key? key}) : super(key: key);

  @override
  State<PagamentosUpdateFormScreen> createState() =>
      _PagamentosUpdateFormScreenState();
}

class _PagamentosUpdateFormScreenState
    extends State<PagamentosUpdateFormScreen> {
  final _valorController = TextEditingController();
  DateTime? _dataPagamentoController;
  DateTime? _dataVencimentoController;
  final _formaPagamentoController = TextEditingController();
  bool _status = true;

  void _updateForm(PagamentoItem pagamentoItem) {
    _dataPagamentoController ??= pagamentoItem.dataPagamento;
    pagamentoItem.setDataPagamento(_dataPagamentoController!);
    calculoVencimento(_dataPagamentoController!);
    pagamentoItem.setDataVencimento(_dataVencimentoController!);
    pagamentoItem.setStatus(_status);
    if (_valorController.text.isEmpty) {
      _valorController.text = pagamentoItem.valorPagamento!;
    } else {
      pagamentoItem.setValor(_valorController.text);
    }
    if (_formaPagamentoController.text.isEmpty) {
      _formaPagamentoController.text = pagamentoItem.formaPagamento!;
    } else {
      pagamentoItem.setFormaPagamento(_formaPagamentoController.text);
    }

    Provider.of<PagamentosProvider>(context, listen: false)
        .updatePagamento(pagamentoItem);
    Navigator.of(context).pop();
    return;
  }

  void calculoVencimento(DateTime dataPagamento) {
    var differenceDaysLimit = 0;
    var ano = dataPagamento.year;
    var mes = dataPagamento.month;
    if (mes == 2) {
      if (ano % 400 == 0 || (ano % 100 != 0 && ano % 4 == 0)) {
        differenceDaysLimit = 29;
      } else {
        differenceDaysLimit = 28;
      }
    } else if (mes == 4 || mes == 6 || mes == 9 || mes == 11) {
      differenceDaysLimit = 30;
    } else {
      differenceDaysLimit = 31;
    }
    final dataVencimento =
        dataPagamento.add(Duration(days: differenceDaysLimit));
    final difference = dataPagamento.difference(DateTime.now()).inDays * (-1);
    if (difference > differenceDaysLimit) {
      setState(() {
        _status = false;
      });
    }
    setState(() {
      _dataVencimentoController = dataVencimento;
    });
  }

  void _selectDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _dataPagamentoController = pickedDate;
        });
      } else {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pagamento =
        ModalRoute.of(context)!.settings.arguments as PagamentoItem;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alterar Pagamento"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 500,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _valorController,
                        decoration: InputDecoration(
                          labelText: 'Valor',
                          hintText: "R\$" + pagamento.valorPagamento!,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text("Data do pagamento",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 182, 178, 178))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Row(
                          children: [
                            Text(
                              DateFormat('dd/MM/y').format(
                                  _dataPagamentoController != null
                                      ? _dataPagamentoController!
                                      : pagamento.dataPagamento!),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 182, 178, 178)),
                            ),
                            IconButton(
                              icon: const Icon(Icons.date_range),
                              color: Theme.of(context).colorScheme.primary,
                              onPressed: _selectDate,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _formaPagamentoController,
                        decoration: InputDecoration(
                          labelText: 'Forma de Pagamento',
                          hintText: pagamento.formaPagamento,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 0, 165, 84),
                          elevation: 10,
                        ),
                        onPressed: () => _updateForm(pagamento),
                        icon: const Icon(Icons.save),
                        label: const Text("Salvar alterações"),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          elevation: 10,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.cancel),
                        label: const Text("Cancelar"),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
