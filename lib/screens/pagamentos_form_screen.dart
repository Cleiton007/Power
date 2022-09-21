import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:power/models/aluno.dart';
import 'package:power/providers/alunos_provider.dart';
import 'package:power/providers/pagamentos_provider.dart';
import 'package:power/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PagamentosFormScreen extends StatefulWidget {
  const PagamentosFormScreen({Key? key}) : super(key: key);

  @override
  State<PagamentosFormScreen> createState() => _PagamentosFormScreenState();
}

class _PagamentosFormScreenState extends State<PagamentosFormScreen> {
  final _valorController = TextEditingController();
  DateTime? _dataPagamentoController;
  DateTime? _dataVencimentoController;
  final _formaPagamentoController = TextEditingController();
  bool _status = true;

  void _submitPagamento() {
    _dataPagamentoController ??= DateTime.now();
    calculoVencimento(_dataPagamentoController!);
    if (_valorController.text.isEmpty ||
        _formaPagamentoController.text.isEmpty) {
      return;
    }
    final aluno = ModalRoute.of(context)?.settings.arguments as Aluno;
    aluno.setStatus(true);
    Provider.of<AlunosProvider>(context, listen: false).updateAluno(aluno);
    Provider.of<PagamentosProvider>(context, listen: false).addPagamento(
        _status,
        _valorController.text,
        _dataPagamentoController!,
        _dataVencimentoController!,
        aluno.id!,
        aluno.nomeCompleto!,
        _formaPagamentoController.text);
    Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.ALUNOS_SCREEN, ModalRoute.withName(AppRoutes.HOME));
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro Mensalidade"),
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
                        decoration: const InputDecoration(
                          labelText: 'Valor',
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
                              _dataPagamentoController == null
                                  ? DateFormat('dd/MM/y').format(DateTime.now())
                                  : DateFormat('dd/MM/y')
                                      .format(_dataPagamentoController!),
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
                        decoration: const InputDecoration(
                          labelText: 'Forma de Pagamento',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 165, 84),
                    elevation: 10,
                  ),
                  onPressed: _submitPagamento,
                  icon: const Icon(Icons.save),
                  label: const Text("Salvar Pagamento"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
