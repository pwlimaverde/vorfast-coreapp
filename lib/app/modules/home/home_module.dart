import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
//imports internos
import 'home_controller.dart';
import 'home_page.dart';
import 'repositories/home_repository.dart';
import 'repositories/interfaces/home_repository_interface.dart';
import '../../shared/auth/auth_store.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IHomeRepository>((i) => HomeRepository(Firestore.instance)),
        Bind((i) => HomeController(
            repo: i.get<IHomeRepository>(), auth: i.get<AuthStore>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
