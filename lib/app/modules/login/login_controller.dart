import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
//Importes Internos
import '../../shared/auth/auth_controller.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  //Controles Gerais
  final AuthController controllerAuth = Modular.get();


  //Controles Internos
  @observable
  bool loading = false;

}
