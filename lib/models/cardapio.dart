class Produto {
  final int idProduto;
  final String produtoNome;
  final String? produtoDescricao;
  final double produtoValor;
  final String? produtoImagem;
  final bool produtoAtivo;

  Produto({
    required this.idProduto,
    required this.produtoNome,
    this.produtoDescricao,
    required this.produtoValor,
    this.produtoImagem,
    required this.produtoAtivo,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      idProduto: json['id_produto'] as int,
      produtoNome: json['produto_nome'] as String,
      produtoDescricao: json['produto_descricao'] as String?,
      produtoValor: (json['produto_valor'] as num).toDouble(),
      produtoImagem: json['produto_imagem'] as String?,
      produtoAtivo: json['produto_ativo'] as bool,
    );
  }
}

class ProdutoCardapio {
  final int idProdutoCardapio;
  final Produto produto;

  ProdutoCardapio({
    required this.idProdutoCardapio,
    required this.produto,
  });

  factory ProdutoCardapio.fromJson(Map<String, dynamic> json) {
    return ProdutoCardapio(
      idProdutoCardapio: json['id_produto_cardapio'] as int,
      produto: Produto.fromJson(json['produto'] as Map<String, dynamic>),
    );
  }
}

class Cardapio {
  final int idCardapio;
  final int cardapioIdLoja;
  final String cardapioNome;
  final bool cardapioAtivo;
  final List<ProdutoCardapio> produtos;

  Cardapio({
    required this.idCardapio,
    required this.cardapioIdLoja,
    required this.cardapioNome,
    required this.cardapioAtivo,
    required this.produtos,
  });

  factory Cardapio.fromJson(Map<String, dynamic> json) {
    final produtosJson = json['produtos'] as List<dynamic>? ?? [];
    return Cardapio(
      idCardapio: json['id_cardapio'] as int,
      cardapioIdLoja: json['cardapio_id_loja'] as int,
      cardapioNome: json['cardapio_nome'] as String,
      cardapioAtivo: json['cardapio_ativo'] as bool,
      produtos: produtosJson
          .map((p) => ProdutoCardapio.fromJson(p as Map<String, dynamic>))
          .toList(),
    );
  }
}
