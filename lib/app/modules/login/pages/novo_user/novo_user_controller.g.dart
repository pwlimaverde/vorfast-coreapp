// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novo_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NovoUserController on _NovoUserControllerBase, Store {
  final _$statusAtom = Atom(name: '_NovoUserControllerBase.status');

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

  final _$setUserEmailAsyncAction =
      AsyncAction('_NovoUserControllerBase.setUserEmail');

  @override
  Future<void> setUserEmail(
      {@required VoidCallback onSuccess, @required VoidCallback onFail}) {
    return _$setUserEmailAsyncAction
        .run(() => super.setUserEmail(onSuccess: onSuccess, onFail: onFail));
  }

  final _$_NovoUserControllerBaseActionController =
      ActionController(name: '_NovoUserControllerBase');

  @override
  dynamic setStatus(AppStatus valor) {
    final _$actionInfo = _$_NovoUserControllerBaseActionController.startAction(
        name: '_NovoUserControllerBase.setStatus');
    try {
      return super.setStatus(valor);
    } finally {
      _$_NovoUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
