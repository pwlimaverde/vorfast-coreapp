import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
//imports internos
import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'shared/local_storage/local_storage.dart';
import 'shared/theme/repositore/theme_interface.dart';
import 'shared/theme/repositore/theme_repository.dart';
import 'shared/theme/theme_controller.dart';
import 'splash/splash_page.dart';


class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<IThemeRepository>((i) => ThemeRepository(Firestore.instance)),
        Bind((i) => ThemeController(i.get())),
        Bind((i) => AppController()),
        Bind((i) => LocalStorage()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => SplashPage(),
          transition: TransitionType.noTransition,
        ),
        Router("/home", module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
