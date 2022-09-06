import 'package:flutter/material.dart';
import 'package:power/models/aluno.dart';
import 'package:power/models/pagamento_item.dart';
import 'package:power/providers/pagamentos_provider.dart';
import 'package:power/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PagamentosAluno extends StatelessWidget {
  const PagamentosAluno({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Aluno aluno = ModalRoute.of(context)!.settings.arguments as Aluno;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              "Pagamentos",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Container(
            height: 650,
            child: Consumer<PagamentosProvider>(
                child: Container(),
                builder: (ctx, pagamentosProvider, ch) => pagamentosProvider
                            .itemsCount ==
                        0
                    ? ch!
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: pagamentosProvider.itemsCount,
                        itemBuilder: (ctx, i) {
                          if (pagamentosProvider.itemByIndex(i).nameAluno !=
                              aluno.nomeCompleto) {
                            if (pagamentosProvider.itemsCount != i) {
                              return ch!;
                            }
                            return Container();
                          }
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Card(
                                    elevation: 10,
                                    color: const Color.fromARGB(221, 66, 70, 86)
                                        .withOpacity(0.5),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "status",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                pagamentosProvider
                                                    .itemByIndex(i)
                                                    .status,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Valor",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "R\$ " +
                                                    pagamentosProvider
                                                        .itemByIndex(i)
                                                        .valorPagamento,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Data pagamento",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                pagamentosProvider
                                                    .itemByIndex(i)
                                                    .dataPagamento,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              elevation: 5,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                    AppRoutes.PAGAMENTOS_FORM_SCREEN,
                    arguments: aluno);
              },
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
