import 'dart:convert';

import 'package:coreapp/app/shared/local_storage/local_storage.dart';
import 'package:coreapp/app/shared/theme/model/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

//imports internos
import 'repositore/theme_interface.dart';

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
        json.decode(await LocalStorage.getValue("localTeheme")));
  }

  @computed
  ThemeData get themeApp {
    if (fireTheme.value != null) {
      print("tema fire ${0xff483D8B}");
      print("tema fire ${fireTheme.value}");
      LocalStorage.setValue<String>(
          "localTeheme", json.encode(fireTheme.value.toJson()));
      return ThemeData(
        primaryColor: Color(fireTheme.value.primaryColor),
        accentColor: Color(fireTheme.value.accentColor),
      );
    } else if (localTheme != null) {
      print("tema local");
      return ThemeData(
        primaryColor: Color(localTheme.primaryColor),
        accentColor: Color(localTheme.accentColor),
      );
    } else {
      print("tema deful");
      return ThemeData(
        primaryColor: Color(0xffffffff),
        accentColor: Color(0xffffffff),
      );
    }
  }
//fim do controle de tema
}
