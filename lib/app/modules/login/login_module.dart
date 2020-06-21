import 'package:flutter_modular/flutter_modular.dart';
//Importes Internos
import 'login_page.dart';
import 'login_controller.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
