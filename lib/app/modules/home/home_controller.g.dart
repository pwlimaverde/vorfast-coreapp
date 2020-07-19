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
  Computed<bool> _$isPrimaryComputed;

  @override
  bool get isPrimary =>
      (_$isPrimaryComputed ??= Computed<bool>(() => super.isPrimary,
              name: '_HomeControllerBase.isPrimary'))
          .value;
  Computed<Color> _$corPrymaryComputed;

  @override
  Color get corPrymary =>
      (_$corPrymaryComputed ??= Computed<Color>(() => super.corPrymary,
              name: '_HomeControllerBase.corPrymary'))
          .value;
  Computed<bool> _$isAccentComputed;

  @override
  bool get isAccent =>
      (_$isAccentComputed ??= Computed<bool>(() => super.isAccent,
              name: '_HomeControllerBase.isAccent'))
          .value;
  Computed<Color> _$corAccentComputed;

  @override
  Color get corAccent =>
      (_$corAccentComputed ??= Computed<Color>(() => super.corAccent,
              name: '_HomeControllerBase.corAccent'))
          .value;
  Computed<List<Widget>> _$listSlvComputed;

  @override
  List<Widget> get listSlv =>
      (_$listSlvComputed ??= Computed<List<Widget>>(() => super.listSlv,
              name: '_HomeControllerBase.listSlv'))
          .value;
  Computed<List<Widget>> _$listSlvEditComputed;

  @override
  List<Widget> get listSlvEdit =>
      (_$listSlvEditComputed ??= Computed<List<Widget>>(() => super.listSlvEdit,
              name: '_HomeControllerBase.listSlvEdit'))
          .value;

  final _$primeREditValidoAtom =
      Atom(name: '_HomeControllerBase.primeREditValido');

  @override
  int get primeREditValido {
    _$primeREditValidoAtom.reportRead();
    return super.primeREditValido;
  }

  @override
  set primeREditValido(int value) {
    _$primeREditValidoAtom.reportWrite(value, super.primeREditValido, () {
      super.primeREditValido = value;
    });
  }

  final _$primeGEditValidoAtom =
      Atom(name: '_HomeControllerBase.primeGEditValido');

  @override
  int get primeGEditValido {
    _$primeGEditValidoAtom.reportRead();
    return super.primeGEditValido;
  }

  @override
  set primeGEditValido(int value) {
    _$primeGEditValidoAtom.reportWrite(value, super.primeGEditValido, () {
      super.primeGEditValido = value;
    });
  }

  final _$primeBEditValidoAtom =
      Atom(name: '_HomeControllerBase.primeBEditValido');

  @override
  int get primeBEditValido {
    _$primeBEditValidoAtom.reportRead();
    return super.primeBEditValido;
  }

  @override
  set primeBEditValido(int value) {
    _$primeBEditValidoAtom.reportWrite(value, super.primeBEditValido, () {
      super.primeBEditValido = value;
    });
  }

  final _$accentREditValidoAtom =
      Atom(name: '_HomeControllerBase.accentREditValido');

  @override
  int get accentREditValido {
    _$accentREditValidoAtom.reportRead();
    return super.accentREditValido;
  }

  @override
  set accentREditValido(int value) {
    _$accentREditValidoAtom.reportWrite(value, super.accentREditValido, () {
      super.accentREditValido = value;
    });
  }

  final _$accentGEditValidoAtom =
      Atom(name: '_HomeControllerBase.accentGEditValido');

  @override
  int get accentGEditValido {
    _$accentGEditValidoAtom.reportRead();
    return super.accentGEditValido;
  }

  @override
  set accentGEditValido(int value) {
    _$accentGEditValidoAtom.reportWrite(value, super.accentGEditValido, () {
      super.accentGEditValido = value;
    });
  }

  final _$accentBEditValidoAtom =
      Atom(name: '_HomeControllerBase.accentBEditValido');

  @override
  int get accentBEditValido {
    _$accentBEditValidoAtom.reportRead();
    return super.accentBEditValido;
  }

  @override
  set accentBEditValido(int value) {
    _$accentBEditValidoAtom.reportWrite(value, super.accentBEditValido, () {
      super.accentBEditValido = value;
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

  final _$allSecaoAtom = Atom(name: '_HomeControllerBase.allSecao');

  @override
  ObservableStream<List<SecaoModel>> get allSecao {
    _$allSecaoAtom.reportRead();
    return super.allSecao;
  }

  @override
  set allSecao(ObservableStream<List<SecaoModel>> value) {
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

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setPrimeR(int valor) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setPrimeR');
    try {
      return super.setPrimeR(valor);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrimeG(int valor) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setPrimeG');
    try {
      return super.setPrimeG(valor);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrimeB(int valor) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setPrimeB');
    try {
      return super.setPrimeB(valor);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAccentR(int valor) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setAccentR');
    try {
      return super.setAccentR(valor);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAccentG(int valor) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setAccentG');
    try {
      return super.setAccentG(valor);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAccentB(int valor) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setAccentB');
    try {
      return super.setAccentB(valor);
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
  void getAllSecao() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getAllSecao');
    try {
      return super.getAllSecao();
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
primeREditValido: ${primeREditValido},
primeGEditValido: ${primeGEditValido},
primeBEditValido: ${primeBEditValido},
accentREditValido: ${accentREditValido},
accentGEditValido: ${accentGEditValido},
accentBEditValido: ${accentBEditValido},
status: ${status},
allSecao: ${allSecao},
isEditeMode: ${isEditeMode},
isAdmin: ${isAdmin},
isPrimary: ${isPrimary},
corPrymary: ${corPrymary},
isAccent: ${isAccent},
corAccent: ${corAccent},
listSlv: ${listSlv},
listSlvEdit: ${listSlvEdit}
    ''';
  }
}
