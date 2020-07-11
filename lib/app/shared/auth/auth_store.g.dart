// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$statusAtom = Atom(name: '_AuthStoreBase.status');

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

  final _$currentUserAtom = Atom(name: '_AuthStoreBase.currentUser');

  @override
  FirebaseUser get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(FirebaseUser value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$currentUserDataAtom = Atom(name: '_AuthStoreBase.currentUserData');

  @override
  UserModel get currentUserData {
    _$currentUserDataAtom.reportRead();
    return super.currentUserData;
  }

  @override
  set currentUserData(UserModel value) {
    _$currentUserDataAtom.reportWrite(value, super.currentUserData, () {
      super.currentUserData = value;
    });
  }

  final _$setUserAsyncAction = AsyncAction('_AuthStoreBase.setUser');

  @override
  Future<void> setUser(FirebaseUser value) {
    return _$setUserAsyncAction.run(() => super.setUser(value));
  }

  final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase');

  @override
  dynamic setStatus(AppStatus valor) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setStatus');
    try {
      return super.setStatus(valor);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
currentUser: ${currentUser},
currentUserData: ${currentUserData}
    ''';
  }
}
