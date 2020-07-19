// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$statusAtom = Atom(name: '_LoginControllerBase.status');

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

  final _$signInEmailLoginAsyncAction =
      AsyncAction('_LoginControllerBase.signInEmailLogin');

  @override
  Future<void> signInEmailLogin(
      {@required VoidCallback onSuccess, @required VoidCallback onFail}) {
    return _$signInEmailLoginAsyncAction.run(
        () => super.signInEmailLogin(onSuccess: onSuccess, onFail: onFail));
  }

  final _$signInGoogleLoginAsyncAction =
      AsyncAction('_LoginControllerBase.signInGoogleLogin');

  @override
  Future<void> signInGoogleLogin(
      {@required VoidCallback onSuccess, @required VoidCallback onFail}) {
    return _$signInGoogleLoginAsyncAction.run(
        () => super.signInGoogleLogin(onSuccess: onSuccess, onFail: onFail));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic setStatus(AppStatus valor) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setStatus');
    try {
      return super.setStatus(valor);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
