import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
//imports internos
import 'model/theme_model.dart';
import 'repositore/theme_interface.dart';
import '../local_storage/local_storage.dart';

part 'theme_controller.g.dart';

class ThemeController = _ThemeControllerBase with _$ThemeController;

abstract class _ThemeControllerBase with Store {
  final IThemeRepository repo;

  _ThemeControllerBase(this.repo) {
    _setThemeFire();
    _setThemeLocal();
  }

  //inicio do controle de tema
  @observable
  ObservableStream<ThemeModel> fireTheme;

  @action
  _setThemeFire() {
    fireTheme = repo.getConfgTheme().asObservable();
  }

  @observable
  ThemeModel localTheme;

  @action
  _setThemeLocal() async {
    localTheme = ThemeModel.fromJson(
        json.decode(await LocalStorage.getValue<String>("localTeheme")));
  }

  @computed
  ThemeData get themeApp {
    if (fireTheme.value != null) {
      LocalStorage.setValue<String>(
          "localTeheme", json.encode(fireTheme.value.toJson()));
      return ThemeData(
        primaryColor: Color.fromRGBO(
          fireTheme.value.primaryR,
          fireTheme.value.primaryG,
          fireTheme.value.primaryB,
          1.0,
        ),
        accentColor: Color.fromRGBO(
          fireTheme.value.accentR,
          fireTheme.value.accentG,
          fireTheme.value.accentB,
          1.0,
        ),
      );
    } else if (localTheme != null) {
//      print("tema local");
      return ThemeData(
        primaryColor: Color.fromRGBO(
          localTheme.primaryR,
          localTheme.primaryG,
          localTheme.primaryB,
          1.0,
        ),
        accentColor: Color.fromRGBO(
          localTheme.accentR,
          localTheme.accentG,
          localTheme.accentB,
          1.0,
        ),
      );
    } else {
//      print("tema deful");
      return ThemeData(
        primaryColor: Color(0xffffffff),
        accentColor: Color(0xffffffff),
      );
    }
  }
//fim do controle de tema
}
