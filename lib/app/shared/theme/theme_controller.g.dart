// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeController on _ThemeControllerBase, Store {
  Computed<ThemeData> _$themeAppComputed;

  @override
  ThemeData get themeApp =>
      (_$themeAppComputed ??= Computed<ThemeData>(() => super.themeApp,
              name: '_ThemeControllerBase.themeApp'))
          .value;

  final _$fireThemeAtom = Atom(name: '_ThemeControllerBase.fireTheme');

  @override
  ObservableStream<ThemeModel> get fireTheme {
    _$fireThemeAtom.reportRead();
    return super.fireTheme;
  }

  @override
  set fireTheme(ObservableStream<ThemeModel> value) {
    _$fireThemeAtom.reportWrite(value, super.fireTheme, () {
      super.fireTheme = value;
    });
  }

  final _$localThemeAtom = Atom(name: '_ThemeControllerBase.localTheme');

  @override
  ThemeModel get localTheme {
    _$localThemeAtom.reportRead();
    return super.localTheme;
  }

  @override
  set localTheme(ThemeModel value) {
    _$localThemeAtom.reportWrite(value, super.localTheme, () {
      super.localTheme = value;
    });
  }

  final _$_setThemeLocalAsyncAction =
      AsyncAction('_ThemeControllerBase._setThemeLocal');

  @override
  Future _setThemeLocal() {
    return _$_setThemeLocalAsyncAction.run(() => super._setThemeLocal());
  }

  final _$_ThemeControllerBaseActionController =
      ActionController(name: '_ThemeControllerBase');

  @override
  dynamic _setThemeFire() {
    final _$actionInfo = _$_ThemeControllerBaseActionController.startAction(
        name: '_ThemeControllerBase._setThemeFire');
    try {
      return super._setThemeFire();
    } finally {
      _$_ThemeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fireTheme: ${fireTheme},
localTheme: ${localTheme},
themeApp: ${themeApp}
    ''';
  }
}
