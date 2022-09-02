import 'package:flutter/material.dart';
import 'package:power/screens/dados_pessoais_aluno.dart';

class AlunoDetailScreen extends StatelessWidget {
  const AlunoDetailScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informações do aluno"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: const Color.fromARGB(221, 66, 70, 86).withOpacity(0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      padding: const EdgeInsets.all(10),
                      onPressed: (){},
                      icon: const Icon(Icons.account_circle),
                      iconSize: 50,
                      color: Theme.of(context).colorScheme.primary),
                  IconButton(
                    padding: EdgeInsets.all(10),
                    onPressed: (){},
                    icon: const Icon(Icons.monetization_on),
                    iconSize: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  IconButton(
                    padding: EdgeInsets.all(10),
                    onPressed: () {},
                    icon: const Icon(Icons.accessibility_outlined),
                    iconSize: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  IconButton(
                    padding: EdgeInsets.all(10),
                    onPressed: () {},
                    icon: const Icon(Icons.assignment_rounded),
                    iconSize: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  IconButton(
                    padding: EdgeInsets.all(10),
                    onPressed: () {},
                    icon: const Icon(Icons.checklist),
                    iconSize: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
              elevation: 10,
            ),
          ),
          //const DadosPessoaisAluno(),
        ],
      ),
    );
  }
}
