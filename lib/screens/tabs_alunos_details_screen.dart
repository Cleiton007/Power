import 'package:flutter/material.dart';
import 'package:power/components_tabBar/dados_pessoais_aluno.dart';
import 'package:power/components_tabBar/pagamentos_aluno.dart';

class TabsAlunosDetailsScreen extends StatelessWidget {
  const TabsAlunosDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Informações do aluno"),
          bottom: const TabBar(

            tabs: [
            Tab(
              icon: Icon(Icons.account_circle),
            ),
            Tab(
              icon: Icon(Icons.monetization_on),
            ),
            Tab(
              icon: Icon(Icons.accessibility_outlined),
            ),
            Tab(
              icon: Icon(Icons.assignment_rounded),
            ),
            Tab(
              icon: Icon(Icons.checklist),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            const DadosPessoaisAluno(),
            const PagamentosAluno(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
