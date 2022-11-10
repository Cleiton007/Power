import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:power/models/aluno.dart';
import 'package:power/providers/pagamentos_provider.dart';
import 'package:power/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PagamentosAluno extends StatefulWidget {
  const PagamentosAluno({
    Key? key,
  }) : super(key: key);

  @override
  State<PagamentosAluno> createState() => _PagamentosAlunoState();
}

class _PagamentosAlunoState extends State<PagamentosAluno> {
  bool statusValido = false;
  //bool _isLoading = true;

  void _selectStatus(Aluno aluno) {
    statusValido == false
        ? Navigator.of(context)
            .pushNamed(AppRoutes.PAGAMENTOS_FORM_SCREEN, arguments: aluno)
        : ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              content: Text(
                "Pagamento atual está válido!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
            ),
          );
  }

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
                          if (pagamentosProvider.itemByIndex(i).alunoId !=
                              aluno.id) {
                            if (pagamentosProvider.itemsCount != i) {
                              return ch!;
                            }
                            return Container();
                          }
                          SchedulerBinding.instance!.addPostFrameCallback((_) {
                           if (pagamentosProvider.itemByIndex(i).status ==
                                true) {
                              if (this.mounted) {
                                setState(() {
                                statusValido = true;
                              });
                              }
                            }else {
                              if (this.mounted) {
                                setState(() {
                                statusValido = false;
                              });
                              }
                            }
                          });
                          // Future.delayed(Duration.zero, () {
                          //   if (pagamentosProvider.itemByIndex(i).status ==
                          //       true) {
                          //     setState(() {
                          //       statusValido = true;
                          //     });
                          //   } else {
                          //     setState(() {
                          //       statusValido = false;
                          //     });
                          //   }
                          // });
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    elevation: 10,
                                    color: const Color.fromARGB(221, 66, 70, 86)
                                        .withOpacity(0.5),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
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
                                                    "R\$" +
                                                        pagamentosProvider
                                                            .itemByIndex(i)
                                                            .valorPagamento!,
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
                                                    "Data Pagamento",
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    DateFormat('dd/MM/y').format(
                                                        pagamentosProvider
                                                            .itemByIndex(i)
                                                            .dataPagamento!),
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Forma Pagamento",
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
                                                        .formaPagamento!,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                              height: 1, color: Colors.grey),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Status",
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      pagamentosProvider
                                                              .itemByIndex(i)
                                                              .status!
                                                          ? pagamentosProvider
                                                              .itemByIndex(i)
                                                              .status
                                                              .toString()
                                                              .replaceAll(
                                                                  'true',
                                                                  'VÁLIDO')
                                                          : pagamentosProvider
                                                              .itemByIndex(i)
                                                              .status
                                                              .toString()
                                                              .replaceAll(
                                                                  'false',
                                                                  'VENCIDO'),
                                                      style: TextStyle(
                                                          color: pagamentosProvider
                                                                  .itemByIndex(
                                                                      i)
                                                                  .status!
                                                              ? Colors.green
                                                              : Colors.red),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 150),
                                                child: Column(
                                                  children: [
                                                    const Text(
                                                      "Data Vencimento",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(DateFormat('dd/MM/y')
                                                        .format(pagamentosProvider
                                                            .itemByIndex(i)
                                                            .dataVencimento!)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      splashColor: const Color.fromARGB(
                                          255, 152, 170, 224),
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            AppRoutes
                                                .PAGAMENTOS_UPDATE_FORM_SCREEN,
                                            arguments: pagamentosProvider
                                                .itemByIndex(i));
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        size: 25,
                                      ))
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
              onPressed: () => _selectStatus(aluno),
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
