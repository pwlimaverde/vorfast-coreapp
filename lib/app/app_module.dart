import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

//imports internos
import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/categorias/categorias_module.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/produtos/produtos_module.dart';
import 'shared/auth/auth_controller.dart';
import 'shared/auth/repositories/auth_repository.dart';
import 'shared/auth/repositories/interfaces/auth_repository_interface.dart';
import 'shared/local_storage/local_storage.dart';
import 'shared/theme/repositore/theme_interface.dart';
import 'shared/theme/repositore/theme_repository.dart';
import 'shared/theme/theme_controller.dart';
import 'shared/widgets/widgets_controller.dart';
import 'splash/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        //Global
        Bind((i) => WidgetsController()),
        Bind<IThemeRepository>((i) => ThemeRepository(Firestore.instance)),
        Bind((i) => ThemeController(i.get())),
        Bind((i) => LocalStorage()),
        Bind<IAuthRepository>((i) => AuthRepository(
            auth: FirebaseAuth.instance, fire: Firestore.instance)),
        Bind((i) => AuthController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(
          "/sp",
          child: (_, args) => SplashPage(),
          transition: TransitionType.noTransition,
        ),
        Router(Modular.initialRoute, module: HomeModule()),
        Router("/categorias", module: CategoriasModule()),
        Router("/produtos", module: ProdutosModule()),
        Router("/login", module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
