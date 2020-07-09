// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$statusAtom = Atom(name: '_HomeControllerBase.status');

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

  final _$allPromoAtom = Atom(name: '_HomeControllerBase.allPromo');

  @override
  ObservableStream<List<PromoModel>> get allPromo {
    _$allPromoAtom.reportRead();
    return super.allPromo;
  }

  @override
  set allPromo(ObservableStream<List<PromoModel>> value) {
    _$allPromoAtom.reportWrite(value, super.allPromo, () {
      super.allPromo = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setStatus(AppStatus valor) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setStatus');
    try {
      return super.setStatus(valor);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getAllPromo() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getAllPromo');
    try {
      return super.getAllPromo();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
allPromo: ${allPromo}
    ''';
  }
}
