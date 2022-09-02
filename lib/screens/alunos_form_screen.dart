import 'package:flutter/material.dart';
import 'package:power/providers/alunos_provider.dart';
import 'package:provider/provider.dart';

class AlunosFormScreen extends StatefulWidget {
  const AlunosFormScreen({Key? key}) : super(key: key);

  @override
  State<AlunosFormScreen> createState() => _AlunosFormScreenState();
}

class _AlunosFormScreenState extends State<AlunosFormScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var _textoErro;
  final _nomeAlunoController = TextEditingController();
  final _dataNascController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _possuiPatologiaController = TextEditingController();
  final _possuiAcompanhamentoController = TextEditingController();
  final _objetivoController = TextEditingController();

  void _submitForm() {
    if (_nomeAlunoController.text.isEmpty ||
        _dataNascController.text.isEmpty ||
        _telefoneController.text.isEmpty ||
        _enderecoController.text.isEmpty ||
        _possuiPatologiaController.text.isEmpty ||
        _possuiAcompanhamentoController.text.isEmpty ||
        _objetivoController.text.isEmpty) {
      return;
    }

    Provider.of<AlunosProvider>(context, listen: false).addAluno(
      _nomeAlunoController.text,
      _dataNascController.text,
      _telefoneController.text,
      _enderecoController.text,
      _possuiPatologiaController.text,
      _possuiAcompanhamentoController.text,
      _objetivoController.text,
    );
    _textoErro = null;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro Aluno"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nomeAlunoController,
                        decoration: InputDecoration(
                          labelText: 'Nome do aluno',
                          errorText: _textoErro,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _dataNascController,
                        decoration: InputDecoration(
                          labelText: 'Data de nascimento',
                          errorText: _textoErro,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _telefoneController,
                        decoration: InputDecoration(
                          labelText: 'Telefone',
                          errorText: _textoErro,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _enderecoController,
                        decoration: InputDecoration(
                          labelText: 'Endereço',
                          errorText: _textoErro,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _possuiPatologiaController,
                        decoration: InputDecoration(
                          labelText: 'Possui alguma patologia? Se sim, qual?',
                          errorText: _textoErro,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _possuiAcompanhamentoController,
                        decoration: InputDecoration(
                          labelText: 'Possui acompanhamento Nutricional?',
                          errorText: _textoErro,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _objetivoController,
                        decoration: InputDecoration(
                          labelText: 'Objetivo',
                          errorText: _textoErro,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 0, 165, 84),
                elevation: 10,
              ),
              onPressed: _submitForm,
              icon: const Icon(Icons.add),
              label: const Text("Cadastrar Aluno"),
            ),
          ],
        ),
      ),
    );
  }
}
