// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutosController on _ProdutosControllerBase, Store {
  final _$statusAtom = Atom(name: '_ProdutosControllerBase.status');

  @override
  AppStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AppStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$prodCategoriaAtom =
      Atom(name: '_ProdutosControllerBase.prodCategoria');

  @override
  ObservableStream<List<ProdutosModel>> get prodCategoria {
    _$prodCategoriaAtom.reportRead();
    return super.prodCategoria;
  }

  @override
  set prodCategoria(ObservableStream<List<ProdutosModel>> value) {
    _$prodCategoriaAtom.reportWrite(value, super.prodCategoria, () {
      super.prodCategoria = value;
    });
  }

  final _$_ProdutosControllerBaseActionController =
      ActionController(name: '_ProdutosControllerBase');

  @override
  dynamic setStatus(AppStatus valor) {
    final _$actionInfo = _$_ProdutosControllerBaseActionController.startAction(
        name: '_ProdutosControllerBase.setStatus');
    try {
      return super.setStatus(valor);
    } finally {
      _$_ProdutosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getProdCateg({CategoriasModel categoria}) {
    final _$actionInfo = _$_ProdutosControllerBaseActionController.startAction(
        name: '_ProdutosControllerBase.getProdCateg');
    try {
      return super.getProdCateg(categoria: categoria);
    } finally {
      _$_ProdutosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
prodCategoria: ${prodCategoria}
    ''';
  }
}
