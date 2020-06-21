// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutosModel on _ProdutosModelBase, Store {
  final _$precoAtom = Atom(name: '_ProdutosModelBase.preco');

  @override
  double get preco {
    _$precoAtom.reportRead();
    return super.preco;
  }

  @override
  set preco(double value) {
    _$precoAtom.reportWrite(value, super.preco, () {
      super.preco = value;
    });
  }

  final _$estoqueAtom = Atom(name: '_ProdutosModelBase.estoque');

  @override
  int get estoque {
    _$estoqueAtom.reportRead();
    return super.estoque;
  }

  @override
  set estoque(int value) {
    _$estoqueAtom.reportWrite(value, super.estoque, () {
      super.estoque = value;
    });
  }

  final _$imagensAtom = Atom(name: '_ProdutosModelBase.imagens');

  @override
  List<String> get imagens {
    _$imagensAtom.reportRead();
    return super.imagens;
  }

  @override
  set imagens(List<String> value) {
    _$imagensAtom.reportWrite(value, super.imagens, () {
      super.imagens = value;
    });
  }

  final _$nomeAtom = Atom(name: '_ProdutosModelBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$descricaoAtom = Atom(name: '_ProdutosModelBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$fichaTecnicaAtom = Atom(name: '_ProdutosModelBase.fichaTecnica');

  @override
  Map<String, dynamic> get fichaTecnica {
    _$fichaTecnicaAtom.reportRead();
    return super.fichaTecnica;
  }

  @override
  set fichaTecnica(Map<String, dynamic> value) {
    _$fichaTecnicaAtom.reportWrite(value, super.fichaTecnica, () {
      super.fichaTecnica = value;
    });
  }

  final _$opcoesAtom = Atom(name: '_ProdutosModelBase.opcoes');

  @override
  Map<String, dynamic> get opcoes {
    _$opcoesAtom.reportRead();
    return super.opcoes;
  }

  @override
  set opcoes(Map<String, dynamic> value) {
    _$opcoesAtom.reportWrite(value, super.opcoes, () {
      super.opcoes = value;
    });
  }

  final _$escolhasAtom = Atom(name: '_ProdutosModelBase.escolhas');

  @override
  Map<String, dynamic> get escolhas {
    _$escolhasAtom.reportRead();
    return super.escolhas;
  }

  @override
  set escolhas(Map<String, dynamic> value) {
    _$escolhasAtom.reportWrite(value, super.escolhas, () {
      super.escolhas = value;
    });
  }

  final _$statusAtom = Atom(name: '_ProdutosModelBase.status');

  @override
  bool get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(bool value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$_ProdutosModelBaseActionController =
      ActionController(name: '_ProdutosModelBase');

  @override
  dynamic setStatus(bool valor) {
    final _$actionInfo = _$_ProdutosModelBaseActionController.startAction(
        name: '_ProdutosModelBase.setStatus');
    try {
      return super.setStatus(valor);
    } finally {
      _$_ProdutosModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
preco: ${preco},
estoque: ${estoque},
imagens: ${imagens},
nome: ${nome},
descricao: ${descricao},
fichaTecnica: ${fichaTecnica},
opcoes: ${opcoes},
escolhas: ${escolhas},
status: ${status}
    ''';
  }
}
