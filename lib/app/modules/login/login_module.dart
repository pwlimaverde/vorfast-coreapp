import 'package:flutter_modular/flutter_modular.dart';
//Importes Internos
import 'login_page.dart';
import 'login_controller.dart';
import '../../shared/auth/auth_controller.dart';
import 'pages/novo_user/novo_user_module.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(authController: i.get<AuthController>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
        Router("/novouser", module: NovoUserModule()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
