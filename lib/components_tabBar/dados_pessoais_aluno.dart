import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:power/exceptions/htttp_exception.dart';
import 'package:power/providers/alunos_provider.dart';
import 'package:power/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../models/aluno.dart';

class DadosPessoaisAluno extends StatelessWidget {
  const DadosPessoaisAluno({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);
    final aluno = ModalRoute.of(context)!.settings.arguments as Aluno;
    return SingleChildScrollView(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              "Dados Pessoais",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Container(
            height: 640,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: Card(
                      elevation: 10,
                      color: const Color.fromARGB(221, 66, 70, 86)
                          .withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nome",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(aluno.nomeCompleto!),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Card(
                      elevation: 10,
                      color: const Color.fromARGB(221, 66, 70, 86)
                          .withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Data de nascimento",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(aluno.dataNascimento!),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Card(
                      elevation: 10,
                      color: const Color.fromARGB(221, 66, 70, 86)
                          .withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sexo",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(aluno.sexo!),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Card(
                      elevation: 10,
                      color: const Color.fromARGB(221, 66, 70, 86)
                          .withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Telefone",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(aluno.telefone!),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Card(
                      elevation: 10,
                      color: const Color.fromARGB(221, 66, 70, 86)
                          .withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Endereço",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(aluno.endereco!),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Card(
                      elevation: 10,
                      color: const Color.fromARGB(221, 66, 70, 86)
                          .withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Possui patologia?",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(aluno.patologia!),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Card(
                      elevation: 10,
                      color: const Color.fromARGB(221, 66, 70, 86)
                          .withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Possui acompanhamento nutricional?",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(aluno.acompanhamentoNutricional!),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Card(
                      elevation: 10,
                      color: const Color.fromARGB(221, 66, 70, 86)
                          .withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Objetivo",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(aluno.objetivo!),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Card(
                      elevation: 10,
                      color: const Color.fromARGB(221, 66, 70, 86)
                          .withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Data de cadastro",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(DateFormat('dd/MM/y')
                                    .format(aluno.dataCadastro!)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  splashColor: const Color.fromARGB(255, 152, 170, 224),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                        AppRoutes.ALUNOS_UPDATE_FORM_SCREEN,
                        arguments: aluno);
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).colorScheme.primary,
                    size: 25,
                  )),
              IconButton(
                  splashColor: const Color.fromARGB(255, 211, 111, 104),
                  onPressed: () {
                    showDialog<bool>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Excluir aluno"),
                        content: const Text("Tem certeza?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                              Navigator.of(context).pop(true);
                            },
                            child: const Text('Sim'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(false),
                            child: const Text('Não'),
                          ),
                        ],
                      ),
                    ).then((value) async {
                      print(value);
                      if (value ?? false) {
                        try {
                          await Provider.of<AlunosProvider>(context,
                                  listen: false)
                              .removeAluno(aluno);
                        } on HttpException catch (error) {
                          msg.showSnackBar(
                            SnackBar(
                              content: Text(
                                error.toString(),
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 25,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
