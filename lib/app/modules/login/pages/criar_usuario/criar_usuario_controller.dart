import 'package:coreapp/app/shared/auth/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
//Importes Internos
import '../../../../shared/auth/auth_controller.dart';
import '../../../../shared/utilitario/app_status.dart';

part 'criar_usuario_controller.g.dart';

class CriarUsuarioController = _CriarUsuarioControllerBase
    with _$CriarUsuarioController;

abstract class _CriarUsuarioControllerBase with Store {
  final novoUserFormKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final repetirSenhaController = TextEditingController();
  final enderecoController = TextEditingController();

  //Controles Gerais
  final AuthController authController = Modular.get();

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
