import 'package:flutter/material.dart';
import 'package:power/models/aluno.dart';
import 'package:power/providers/pagamentos_provider.dart';
import 'package:provider/provider.dart';

class PagamentosFormScreen extends StatefulWidget {
  const PagamentosFormScreen({Key? key}) : super(key: key);

  @override
  State<PagamentosFormScreen> createState() => _PagamentosFormScreenState();
}

class _PagamentosFormScreenState extends State<PagamentosFormScreen> {
  final _statusController = TextEditingController();
  final _valorController = TextEditingController();
  final _dataPagamentoController = TextEditingController();

  void _submitPagamento() {
    if (_statusController.text.isEmpty ||
        _valorController.text.isEmpty ||
        _dataPagamentoController.text.isEmpty) {
      return;
    }
    final aluno = ModalRoute.of(context)?.settings.arguments as Aluno;
    
    Provider.of<PagamentosProvider>(context, listen: false).addPagamento(
      _statusController.text,
      _valorController.text,
      _dataPagamentoController.text,
      aluno.id!,
      aluno.nomeCompleto!
    );
    Navigator.of(context).pop();
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
                    children: [
                      TextField(
                        controller: _statusController,
                        decoration: InputDecoration(
                          labelText: 'Status',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _valorController,
                        decoration: const InputDecoration(
                          labelText: 'Valor',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _dataPagamentoController,
                        decoration: const InputDecoration(
                          labelText: 'Data de Pagamento',
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
