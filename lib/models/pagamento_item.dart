class PagamentoItem {
  final String id;
  final String alunoId;
  final String nameAluno;
  final bool status;
  final DateTime dataPagamento;
  final DateTime dataVencimento;
  final String valorPagamento;
  final String formaPagamento;

  PagamentoItem({
    required this.id,
    required this.alunoId,
    required this.nameAluno,
    required this.status,
    required this.dataPagamento,
    required this.dataVencimento,
    required this.valorPagamento,
    required this.formaPagamento,
  });
}
