// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$statusAtom = Atom(name: '_AuthControllerBase.status');

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

  final _$currentUserAtom = Atom(name: '_AuthControllerBase.currentUser');

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

  final _$currentUserDataAtom =
      Atom(name: '_AuthControllerBase.currentUserData');

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

  final _$signInEmailLoginAsyncAction =
      AsyncAction('_AuthControllerBase.signInEmailLogin');

  @override
  Future<void> signInEmailLogin({String email, String pass}) {
    return _$signInEmailLoginAsyncAction
        .run(() => super.signInEmailLogin(email: email, pass: pass));
  }

  final _$novoEmailLoginAsyncAction =
      AsyncAction('_AuthControllerBase.novoEmailLogin');

  @override
  Future<void> novoEmailLogin({UserModel user, String pass}) {
    return _$novoEmailLoginAsyncAction
        .run(() => super.novoEmailLogin(user: user, pass: pass));
  }

  final _$singOutAsyncAction = AsyncAction('_AuthControllerBase.singOut');

  @override
  Future<void> singOut() {
    return _$singOutAsyncAction.run(() => super.singOut());
  }

  final _$googleLoginAsyncAction =
      AsyncAction('_AuthControllerBase.googleLogin');

  @override
  Future<dynamic> googleLogin() {
    return _$googleLoginAsyncAction.run(() => super.googleLogin());
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic setStatus(AppStatus valor) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setStatus');
    try {
      return super.setStatus(valor);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUser(FirebaseUser value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
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
