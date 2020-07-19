import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
//Importes Internos
import '../../shared/auth/auth_store.dart';
import '../../shared/utilitario/app_status.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  //Variaveis internas
  final loginFormKey = GlobalKey<FormState>();
  final senhaController = TextEditingController();
  final emailController = TextEditingController();

  final AuthStore authController;

  _LoginControllerBase({@required this.authController});

  //Controles Internos
  @observable
  AppStatus status = AppStatus.none;

  @action
  setStatus(AppStatus valor) {
    status = valor;
  }

  @action
  Future<void> signInEmailLogin({
    @required VoidCallback onSuccess,
    @required VoidCallback onFail,
  }) async {
    setStatus(AppStatus.loading..valorSet = "email");
    await authController
        .signInEmailLogin(
      email: emailController.text,
      pass: senhaController.text,
    )
        .then((_) {
      if (authController.currentUser != null) {
        setStatus(AppStatus.success);
        onSuccess();
      } else {
        setStatus(authController.status);
        onFail();
      }
    });
  }

  @action
  Future<void> signInGoogleLogin({
    @required VoidCallback onSuccess,
    @required VoidCallback onFail,
  }) async {
    setStatus(AppStatus.loading..valorSet = "google");
    await authController.signInGoogleLogin().then((_) {
      if (authController.currentUser != null) {
        setStatus(AppStatus.success);
        onSuccess();
      } else {
        setStatus(authController.status);
        onFail();
      }
    });
  }

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

  Future<void> recoverPass({
    @required VoidCallback onSuccess,
    @required VoidCallback onFail,
  }) async {
    await authController.recoverPass(email: emailController.text).then((valor) {
      if (valor) {
        print(valor);
        setStatus(AppStatus.success);
        onSuccess();
      } else {
        setStatus(AppStatus.error);
        onFail();
      }
    });
  }
}
