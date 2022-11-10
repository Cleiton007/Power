import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:power/components/main_drawer.dart';
import 'package:power/providers/pagamentos_provider.dart';
import 'package:power/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PagamentosScreen extends StatefulWidget {
  const PagamentosScreen({Key? key}) : super(key: key);

  @override
  State<PagamentosScreen> createState() => _PagamentosScreenState();
}

class _PagamentosScreenState extends State<PagamentosScreen> {
  bool _isLoading = true;

  MainDrawer? _selectDrawer(dynamic drawer) {
    if (drawer != null) {
      return drawer;
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<PagamentosProvider>(
      context,
      listen: false,
    ).loadPagamentos().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  Future<void> _refreshPagamentos(BuildContext context) {
    return Provider.of<PagamentosProvider>(
      context,
      listen: false,
    ).loadPagamentos();
  }

  @override
  Widget build(BuildContext context) {
    final drawer = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagamentos"),
      ),
      drawer: _selectDrawer(drawer),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => _refreshPagamentos(context),
              child: SizedBox(
                width: 650,
                child: Consumer<PagamentosProvider>(
                    child: const Center(
                      child: Text("Nenhum pagamento cadastrado!"),
                    ),
                    builder: (ctx, pagamentosProvider, ch) => pagamentosProvider
                                .itemsCount ==
                            0
                        ? ch!
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: pagamentosProvider.itemsCount,
                            itemBuilder: (ctx, i) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.all(10),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(pagamentosProvider
                                          .itemByIndex(i)
                                          .nameAluno!),
                                      Card(
                                        elevation: 10,
                                        color: const Color.fromARGB(
                                                221, 66, 70, 86)
                                            .withOpacity(0.5),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Valor",
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
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
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Data Pagamento",
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
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
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Forma Pagamento",
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
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
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                  height: 1,
                                                  color: Colors.grey),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Status",
                                                          style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary),
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(
                                                          pagamentosProvider
                                                                  .itemByIndex(
                                                                      i)
                                                                  .status!
                                                              ? pagamentosProvider
                                                                  .itemByIndex(
                                                                      i)
                                                                  .status
                                                                  .toString()
                                                                  .replaceAll(
                                                                      'true',
                                                                      'VÁLIDO')
                                                              : pagamentosProvider
                                                                  .itemByIndex(
                                                                      i)
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 150),
                                                    child: Column(
                                                      children: [
                                                        const Text(
                                                          "Data Vencimento",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(DateFormat(
                                                                'dd/MM/y')
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
                                            size: 20,
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            })),
              ),
            ),
    );
  }
}
