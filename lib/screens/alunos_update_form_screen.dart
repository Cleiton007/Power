import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/aluno.dart';
import '../providers/alunos_provider.dart';

class AlunosUpdateFormScreen extends StatefulWidget {
  const AlunosUpdateFormScreen({Key? key}) : super(key: key);

  @override
  State<AlunosUpdateFormScreen> createState() => _AlunosUpdateFormScreenState();
}

class _AlunosUpdateFormScreenState extends State<AlunosUpdateFormScreen> {
  final _nomeAlunoController = TextEditingController();
  final _dataNascController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _possuiPatologiaController = TextEditingController();
  final _possuiAcompanhamentoController = TextEditingController();
  final _objetivoController = TextEditingController();

  void _updateForm(Aluno aluno) {
    if (_nomeAlunoController.text.isEmpty) {
      _nomeAlunoController.text = aluno.nomeCompleto!;
    } else {
      aluno.setNome(_nomeAlunoController.text);
    }
    if (_dataNascController.text.isEmpty) {
      _dataNascController.text = aluno.dataNascimento!;
    }else{
      aluno.setDataNascimento(_dataNascController.text);
    }
    if (_telefoneController.text.isEmpty) {
      _telefoneController.text = aluno.telefone!;
    }else{
      aluno.setTelefone(_telefoneController.text);
    }
    if (_enderecoController.text.isEmpty) {
      _enderecoController.text = aluno.endereco!;
    }else{
      aluno.setEndereco(_enderecoController.text);
    }
    if (_possuiPatologiaController.text.isEmpty) {
      _possuiPatologiaController.text = aluno.patologia!;
    }else{
      aluno.setPatologia(_possuiPatologiaController.text);
    }
    if (_possuiAcompanhamentoController.text.isEmpty) {
      _possuiAcompanhamentoController.text = aluno.acompanhamentoNutricional!;
    }else{
      aluno.setAcompanhamentoNutricional(_possuiAcompanhamentoController.text);
    }
    if (_objetivoController.text.isEmpty) {
      _objetivoController.text = aluno.objetivo!;
    }else{
      aluno.setObjetivo(_objetivoController.text);
    }

    //aluno.setNome(_nomeAlunoController.text);
    //aluno.setDataNascimento(_dataNascController.text);
    //aluno.setTelefone(_telefoneController.text);
    //aluno.setEndereco(_enderecoController.text);
    //aluno.setPatologia(_possuiPatologiaController.text);
    //aluno.setAcompanhamentoNutricional(_possuiAcompanhamentoController.text);
    //aluno.setObjetivo(_objetivoController.text);

    Provider.of<AlunosProvider>(context, listen: false).updateAluno(aluno);
    Navigator.of(context).pop();
    return;
  }

  @override
  Widget build(BuildContext context) {
    final aluno = ModalRoute.of(context)!.settings.arguments as Aluno;
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Alterar dados pessoais"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 600,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        TextField(
                          autofocus: true,
                          controller: _nomeAlunoController,
                          decoration: InputDecoration(
                            labelText: 'Nome do aluno',
                            hintText: aluno.nomeCompleto,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller: _dataNascController,
                          decoration: InputDecoration(
                              labelText: 'Data de nascimento',
                              hintText: aluno.dataNascimento),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller: _telefoneController,
                          decoration: InputDecoration(
                              labelText: 'Telefone', hintText: aluno.telefone),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller: _enderecoController,
                          decoration: InputDecoration(
                              labelText: 'Endereço', hintText: aluno.endereco),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller: _possuiPatologiaController,
                          decoration: InputDecoration(
                              labelText:
                                  'Possui alguma patologia? Se sim, qual?',
                              hintText: aluno.patologia),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller: _possuiAcompanhamentoController,
                          decoration: InputDecoration(
                              labelText: 'Possui acompanhamento Nutricional?',
                              hintText: aluno.acompanhamentoNutricional),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller: _objetivoController,
                          decoration: InputDecoration(
                              labelText: 'Objetivo', hintText: aluno.objetivo),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 165, 84),
                    elevation: 10,
                  ),
                  onPressed: () => _updateForm(aluno),
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
    );
  }
}
