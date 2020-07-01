import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
//Importes Internos
import '../../shared/auth/auth_controller.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  //Variaveis internas
  final loginFormKey = GlobalKey<FormState>();

  //Controles Gerais
  final AuthController controllerAuth = Modular.get();

  //Controles Internos
  @observable
  bool loading = false;

  //Funcoes internas
  String validatorSenha(text) {
    if (text.isEmpty || text.length < 6) {
      return "Senha invalida";
    } else {
      return null;
    }
  }

  String validatorEmail(text) {
    if (text.isEmpty || !text.contains("@")) {
      return "E-mail invalido";
    } else {
      return null;
    }
  }
}
