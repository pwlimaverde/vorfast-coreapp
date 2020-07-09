// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorias_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriasController on _CategoriasControllerBase, Store {
  final _$allCategAtom = Atom(name: '_CategoriasControllerBase.allCateg');

  @override
  List<CategoriasModel> get allCateg {
    _$allCategAtom.reportRead();
    return super.allCateg;
  }

  @override
  set allCateg(List<CategoriasModel> value) {
    _$allCategAtom.reportWrite(value, super.allCateg, () {
      super.allCateg = value;
    });
  }

  final _$getAllCategoriasAsyncAction =
      AsyncAction('_CategoriasControllerBase.getAllCategorias');

  @override
  Future<void> getAllCategorias() {
    return _$getAllCategoriasAsyncAction.run(() => super.getAllCategorias());
  }

  @override
  String toString() {
    return '''
allCateg: ${allCateg}
    ''';
  }
}
