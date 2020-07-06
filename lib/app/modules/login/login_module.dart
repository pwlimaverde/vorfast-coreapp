import 'package:flutter_modular/flutter_modular.dart';
//Importes Internos
import 'login_page.dart';
import 'login_controller.dart';
import 'pages/criar_usuario/criar_usuario_page.dart';
import 'pages/criar_usuario/criar_usuario_controller.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CriarUsuarioController()),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
        Router("/novouser", child: (_, args) => CriarUsuarioPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
