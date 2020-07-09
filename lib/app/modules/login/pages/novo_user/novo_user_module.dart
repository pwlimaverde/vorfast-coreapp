import 'package:flutter_modular/flutter_modular.dart';
//Importes Internos
import '../../../../shared/auth/auth_controller.dart';
import 'novo_user_controller.dart';
import 'novo_user_page.dart';

class NovoUserModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
            (i) => NovoUserController(authController: i.get<AuthController>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => NovoUserPage()),
      ];

  static Inject get to => Inject<NovoUserModule>.of();
}
