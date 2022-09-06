import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:power/providers/alunos_provider.dart';
import 'package:provider/provider.dart';

class AlunosFormScreen extends StatefulWidget {
  const AlunosFormScreen({Key? key}) : super(key: key);

  @override
  State<AlunosFormScreen> createState() => _AlunosFormScreenState();
}

class _AlunosFormScreenState extends State<AlunosFormScreen> {
  final _nomeAlunoController = TextEditingController();
  final _dataNascController = TextEditingController();
  var _sexoController = "";
  final _telefoneController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _possuiPatologiaController = TextEditingController();
  final _possuiAcompanhamentoController = TextEditingController();
  final _objetivoController = TextEditingController();
  DateTime? _dataCadastroController = DateTime.now();

  void _submitForm() {
    if (_nomeAlunoController.text.isEmpty ||
        _dataNascController.text.isEmpty ||
        _sexoController.isEmpty ||
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
        _sexoController,
        _telefoneController.text,
        _enderecoController.text,
        _possuiPatologiaController.text,
        _possuiAcompanhamentoController.text,
        _objetivoController.text,
        _dataCadastroController!);
    Navigator.of(context).pop();
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime.now());
    if (picked != null) {
      _dataCadastroController = picked;
    }
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
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _dataNascController,
                        decoration: InputDecoration(
                          labelText: 'Data de nascimento',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text("Sexo",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                      RadioListTile(
                        title: const Text("Masculino"),
                        // subtitle: _sexoController == ""
                        //     ? const Text(
                        //         "Escolha uma opção",
                        //         style: TextStyle(color: Colors.red),
                        //       )
                        //     : null,
                        activeColor: Theme.of(context).colorScheme.primary,
                        value: "Masculino",
                        groupValue: _sexoController,
                        onChanged: (String? value) {
                          setState(() {
                            _sexoController = value!;
                          });
                          print("Opção escolhida: " + value!);
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      RadioListTile(
                        title: const Text("Feminino"),
                        activeColor: const Color.fromARGB(255, 206, 85, 126),
                        value: "Feminino",
                        groupValue: _sexoController,
                        onChanged: (String? value) {
                          setState(() {
                            _sexoController = value!;
                          });
                          print("Opção escolhida: " + value!);
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _telefoneController,
                        decoration: InputDecoration(
                          labelText: 'Telefone',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _enderecoController,
                        decoration: InputDecoration(
                          labelText: 'Endereço',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _possuiPatologiaController,
                        decoration: InputDecoration(
                          labelText: 'Possui alguma patologia? Se sim, qual?',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _possuiAcompanhamentoController,
                        decoration: InputDecoration(
                          labelText: 'Possui acompanhamento Nutricional?',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: _objetivoController,
                        decoration: InputDecoration(
                          labelText: 'Objetivo',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Data de cadastro"),
                      IconButton(
                        icon: const Icon(Icons.date_range),
                        onPressed: _selectDate
                        ,
                      ),
                      // TextFormField(
                      //   inputFormatters: [MaskTextInputFormatter(mask: 'dd/mm/aaaa')],
                      //   controller: ,
                      //   decoration: InputDecoration(
                      //     labelText: 'Data de cadastro',
                      //     hintText: 'dd/mm/aaaa'
                      //   ),
                      // ),
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
