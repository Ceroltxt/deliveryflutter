class Loja {
  final int idLoja;
  final String lojaNome;
  final String? lojaTelefone;
  final String? lojaCnpj;
  final String? lojaDataCadastro;

  Loja({
    required this.idLoja,
    required this.lojaNome,
    this.lojaTelefone,
    this.lojaCnpj,
    this.lojaDataCadastro,
  });

  factory Loja.fromJson(Map<String, dynamic> json) {
    return Loja(
      idLoja: json['id_loja'] as int,
      lojaNome: json['loja_nome'] as String,
      lojaTelefone: json['loja_telefone'] as String?,
      lojaCnpj: json['loja_cnpj'] as String?,
      lojaDataCadastro: json['loja_data_cadastro'] as String?,
    );
  }
}
