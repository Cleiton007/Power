import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:power/models/aluno.dart';
import 'package:power/providers/alunos_provider.dart';
import 'package:power/utils/app_routes.dart';
import 'package:provider/provider.dart';

class AlunosFormScreen extends StatefulWidget {
  const AlunosFormScreen({Key? key}) : super(key: key);

  @override
  State<AlunosFormScreen> createState() => _AlunosFormScreenState();
}

class _AlunosFormScreenState extends State<AlunosFormScreen> {
  late AlunosProvider alunosProvider;
  bool _isLoading = false;
  bool _executarDialog = true;

  final _id = Random().nextDouble().toString();
  final _nomeAlunoController = TextEditingController();
  final _dataNascController = TextEditingController();
  var _sexoController = "";
  final _telefoneController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _possuiPatologiaController = TextEditingController();
  final _possuiAcompanhamentoController = TextEditingController();
  final _objetivoController = TextEditingController();
  final bool _status = false;

  DateTime? _dataCadastroController;

  // ignore: prefer_typing_uninitialized_variables
  Future<void> _submitForm() async {
    _dataCadastroController ??= DateTime.now();
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

    setState(() => _isLoading = true);
    try {
      await Provider.of<AlunosProvider>(context, listen: false).addAluno(
        _id,
        _nomeAlunoController.text,
        _dataNascController.text,
        _sexoController,
        _telefoneController.text,
        _enderecoController.text,
        _possuiPatologiaController.text,
        _possuiAcompanhamentoController.text,
        _objetivoController.text,
        _dataCadastroController!,
        _status,
      );

      executarDialog();
    } catch (error) {
      setState(() {
        _executarDialog = false;
      });
      await showDialog<void>(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text(
                    'Erro ao salvar dado no Firebase! Contate o desenvolvedor.'),
                content: Text('Código do erro: 1000'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      //restorablePushNamedAndRemoveUntil(AppRoutes.HOME, ((route) => false)),//pushNamedAndRemoveUntil(AppRoutes.HOME, (route) => false),
                      child: const Text('Ok')),
                ],
              ));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void executarDialog() {
    // ignore: prefer_typing_uninitialized_variables
    var aluno;
    alunosProvider = Provider.of<AlunosProvider>(context, listen: false);
    List<Aluno> loadedAlunos = alunosProvider.items;
    for (int index = 0; index < alunosProvider.itemsCount; index++) {
      if (loadedAlunos[index].id == _id) {
        aluno = loadedAlunos[index];
        break;
      }
    }

    if (_executarDialog) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Cadastro do aluno"),
          content: const Text("Lançar pagamento deste aluno?"),
          actions: [
            TextButton(
              onPressed: () {
                aluno == null ? print("aluno está nulo") : print("não nulo");
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //     AppRoutes.PAGAMENTOS_FORM_SCREEN,
                //     ModalRoute.withName(AppRoutes.ALUNOS_SCREEN),
                //     arguments: aluno
                //     );
              },
              child: const Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('Não'),
            ),
          ],
        ),
      );
    }
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
          _dataCadastroController = pickedDate;
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
        title: const Text("Cadastro Aluno"),
      ),
      body: _isLoading
          ? const Center(
              child: SizedBox(
                height: 400,
                width: 400,
                child: AlertDialog(
                  content: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                            RadioListTile(
                              title: const Text("Masculino"),
                              // subtitle: _sexoController == ""
                              //     ? const Text(
                              //         "Escolha uma opção",
                              //         style: TextStyle(color: Colors.red),
                              //       )
                              //     : null,
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              value: "Masculino",
                              groupValue: _sexoController,
                              onChanged: (String? value) {
                                setState(() {
                                  _sexoController = value!;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            RadioListTile(
                              title: const Text("Feminino"),
                              activeColor:
                                  const Color.fromARGB(255, 206, 85, 126),
                              value: "Feminino",
                              groupValue: _sexoController,
                              onChanged: (String? value) {
                                setState(() {
                                  _sexoController = value!;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextField(
                              controller: _telefoneController,
                              decoration: const InputDecoration(
                                labelText: 'Telefone',
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextField(
                              controller: _enderecoController,
                              decoration: const InputDecoration(
                                labelText: 'Endereço',
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextField(
                              controller: _possuiPatologiaController,
                              decoration: InputDecoration(
                                labelText:
                                    'Possui alguma patologia? Se sim, qual?',
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
                            // TextFormField(
                            //   //inputFormatters: [MaskTextInputFormatter(mask: 'dd/mm/aaaa')],
                            //   enabled: false,
                            //   decoration: InputDecoration(
                            //     labelText: 'Data de cadastro',
                            //     hintText: 'dd/mm/aaaa'
                            //   ),
                            // ),
                            const Text(
                              "Data de cadastro",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 182, 178, 178),
                                  fontSize: 16),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    _dataCadastroController == null
                                        ? DateFormat('dd/MM/y')
                                            .format(DateTime.now())
                                        : DateFormat('dd/MM/y')
                                            .format(_dataCadastroController!),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 182, 178, 178)),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.date_range),
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    onPressed: _selectDate,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              "(se o cadastro não é de hoje selecione uma data anterior)",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
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
                    onPressed: () {
                      _submitForm();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Cadastrar Aluno"),
                  ),
                ],
              ),
            ),
    );
  }
}
