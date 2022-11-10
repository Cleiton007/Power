class PagamentoItem {
  String? id;
  String? alunoId;
  String? nameAluno;
  bool? status;
  DateTime? dataPagamento;
  DateTime? dataVencimento;
  String? valorPagamento;
  String? formaPagamento;

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

  void setStatus(bool novoStatus) {
    status = novoStatus;
  }

  void setDataPagamento(DateTime novaDataPagamento) {
    dataPagamento = novaDataPagamento;
  }

  void setDataVencimento(DateTime novaDataVencimento) {
    dataVencimento = novaDataVencimento;
  }

  void setValor(String novoValor) {
    valorPagamento = novoValor;
  }

  void setFormaPagamento(String novaForma) {
    formaPagamento = novaForma;
  }
  
}
