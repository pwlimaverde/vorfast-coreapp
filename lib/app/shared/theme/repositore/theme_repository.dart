//imports internos
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coreapp/app/shared/theme/model/theme_model.dart';

import 'theme_interface.dart';

class ThemeRepository implements IThemeRepository {
  final Firestore firestore;

  ThemeRepository(this.firestore);

  @override
  Stream<ThemeModel> getConfgTheme() {
    try{
      return firestore
          .collection("settingstheme")
          .document("theme")
          .snapshots()
          .map((event) => ThemeModel.fromDocument(event));
    }catch(e){
      return null;
    }
  }
}
