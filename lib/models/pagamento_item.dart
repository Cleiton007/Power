class PagamentoItem {
  final String id;
  final String alunoId;
  final String nameAluno;
  final String status;
  final String dataPagamento;
  final String valorPagamento;

  PagamentoItem({
    required this.id,
    required this.alunoId,
    required this.nameAluno,
    required this.status,
    required this.dataPagamento,
    required this.valorPagamento,
  });
}
