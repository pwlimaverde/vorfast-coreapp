// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool> _$isAdminComputed;

  @override
  bool get isAdmin => (_$isAdminComputed ??= Computed<bool>(() => super.isAdmin,
          name: '_HomeControllerBase.isAdmin'))
      .value;

  final _$primeEditValidoAtom =
      Atom(name: '_HomeControllerBase.primeEditValido');

  @override
  String get primeEditValido {
    _$primeEditValidoAtom.reportRead();
    return super.primeEditValido;
  }

  @override
  set primeEditValido(String value) {
    _$primeEditValidoAtom.reportWrite(value, super.primeEditValido, () {
      super.primeEditValido = value;
    });
  }

  final _$accentEditValidoAtom =
      Atom(name: '_HomeControllerBase.accentEditValido');

  @override
  String get accentEditValido {
    _$accentEditValidoAtom.reportRead();
    return super.accentEditValido;
  }

  @override
  set accentEditValido(String value) {
    _$accentEditValidoAtom.reportWrite(value, super.accentEditValido, () {
      super.accentEditValido = value;
    });
  }

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

  final _$allSecaoAtom = Atom(name: '_HomeControllerBase.allSecao');

  @override
  List<SecaoModel> get allSecao {
    _$allSecaoAtom.reportRead();
    return super.allSecao;
  }

  @override
  set allSecao(List<SecaoModel> value) {
    _$allSecaoAtom.reportWrite(value, super.allSecao, () {
      super.allSecao = value;
    });
  }

  final _$isEditeModeAtom = Atom(name: '_HomeControllerBase.isEditeMode');

  @override
  bool get isEditeMode {
    _$isEditeModeAtom.reportRead();
    return super.isEditeMode;
  }

  @override
  set isEditeMode(bool value) {
    _$isEditeModeAtom.reportWrite(value, super.isEditeMode, () {
      super.isEditeMode = value;
    });
  }

  final _$getAllSecaoAsyncAction =
      AsyncAction('_HomeControllerBase.getAllSecao');

  @override
  Future<void> getAllSecao() {
    return _$getAllSecaoAsyncAction.run(() => super.getAllSecao());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setPrime(String valor) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setPrime');
    try {
      return super.setPrime(valor);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAccent(String valor) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setAccent');
    try {
      return super.setAccent(valor);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void setEdite(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setEdite');
    try {
      return super.setEdite(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
primeEditValido: ${primeEditValido},
accentEditValido: ${accentEditValido},
status: ${status},
allPromo: ${allPromo},
allSecao: ${allSecao},
isEditeMode: ${isEditeMode},
isAdmin: ${isAdmin}
    ''';
  }
}
