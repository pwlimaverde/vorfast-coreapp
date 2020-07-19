import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
//Importes Internos
import '../../../../shared/auth/auth_store.dart';
import '../../../../shared/utilitario/app_status.dart';
import '../../../../shared/model/user_model.dart';

part 'novo_user_controller.g.dart';

class NovoUserController = _NovoUserControllerBase with _$NovoUserController;

abstract class _NovoUserControllerBase with Store {
  final novoUserFormKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final repetirSenhaController = TextEditingController();
  final enderecoController = TextEditingController();

  final AuthStore authController;

  _NovoUserControllerBase({@required this.authController});

  //Controles Internos
  @observable
  AppStatus status = AppStatus.none;

  @action
  setStatus(AppStatus valor) {
    status = valor;
  }

  //Funcoes internas
  String validatorNome(text) {
    if (text.isEmpty) {
      return "Nome invalido";
    } else {
      return null;
    }
  }

  @action
  Future<void> setUserEmail(
      {@required VoidCallback onSuccess, @required VoidCallback onFail}) async {
    setStatus(AppStatus.loading);
    UserModel user = UserModel();
    user.nome = nomeController.text;
    user.email = emailController.text;
    user.endereco = enderecoController.text;
    await authController
        .novoEmailLogin(user: user, pass: senhaController.text)
        .then((value) {
      if (authController.currentUser != null) {
        setStatus(AppStatus.success);
        onSuccess();
      } else {
        setStatus(authController.status);
        onFail();
      }
    });
  }

  String validatorSenha(text) {
    if (text.isEmpty || text.length < 6) {
      return "Senha invalida";
    } else {
      return null;
    }
  }

  String validatorRepetirSenha(text) {
    if (text.isEmpty || senhaController.text != repetirSenhaController.text) {
      return "Repita a senha";
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

  String validatorEndereco(text) {
    if (text.isEmpty) {
      return "Endereço invalido";
    } else {
      return null;
    }
  }
}
