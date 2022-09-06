import 'package:flutter/material.dart';
import 'package:power/models/aluno.dart';
import 'package:power/models/pagamento_item.dart';
import 'package:power/providers/alunos_provider.dart';
import 'package:power/screens/dados_pessoais_aluno.dart';
import 'package:power/screens/pagamentos_aluno.dart';

class TabsAlunosDetailsScreen extends StatelessWidget {
  const TabsAlunosDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final aluno = ModalRoute.of(context)!.settings.arguments;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Informações do aluno"),
          bottom: const TabBar(tabs: [
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
