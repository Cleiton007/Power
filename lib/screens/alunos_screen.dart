import 'package:flutter/material.dart';
import 'package:power/providers/alunos_provider.dart';
import 'package:power/utils/app_routes.dart';
import 'package:provider/provider.dart';

class AlunosScreen extends StatelessWidget {
  const AlunosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alunos"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.ALUNOS_FORM);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Consumer<AlunosProvider>(
        child: const Center(
          child: Text("Nenhum aluno cadastrado!"),
        ),
        builder: (ctx, alunosProvider, ch) => alunosProvider.itemsCount == 0
            ? ch!
            : ListView.separated(
                separatorBuilder: (ctx, i) => const Divider(
                  color: Colors.black,
                ),
                itemCount: alunosProvider.itemsCount,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 8, 33, 56),
                    child: Text(alunosProvider
                        .itemByIndex(i)
                        .nomeCompleto!
                        .substring(0, 1)
                        .toUpperCase()),
                  ),
                  title: Text(alunosProvider.itemByIndex(i).nomeCompleto!),
                  subtitle: Text(
                    alunosProvider.itemByIndex(i).status
                        ? alunosProvider
                            .itemByIndex(i)
                            .status
                            .toString()
                            .replaceAll('true', 'Ativo')
                        : alunosProvider
                            .itemByIndex(i)
                            .status
                            .toString()
                            .replaceAll('false', 'Pendente'),
                    style: TextStyle(
                        color: alunosProvider.itemByIndex(i).status
                            ? Colors.green
                            : Colors.orange),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.TABS_ALUNOS_DETAILS,
                      arguments: alunosProvider.itemByIndex(i),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
