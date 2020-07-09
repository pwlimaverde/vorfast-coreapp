import 'package:coreapp/app/shared/utilitario/app_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

import '../../shared/widgets/widgets_core.dart' as widgetCore;

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return widgetCore.BodyCoreWidget(
      title: "Login",
      page: 0,
      card: buildForm(),
    );
  }

  Widget buildForm() {
    return Form(
      key: controller.loginFormKey,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          widgetCore.FieldCoreWidget(
            controller: controller.emailController,
            label: "E-mail",
            hint: "Digite o e-mail",
            keyBoard: TextInputType.emailAddress,
            validator: controller.validatorEmail,
          ),
          SizedBox(
            height: 16.0,
          ),
          widgetCore.FieldCoreWidget(
            controller: controller.senhaController,
            label: "Senha",
            hint: "Digite a Senha",
            keyBoard: TextInputType.emailAddress,
            validator: controller.validatorSenha,
            obscureText: true,
          ),
          SizedBox(
            height: 4.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: widgetCore.FlatbuttonCoreWidget(
              title: "Esqueci minha senha",
              onPressed: () {},
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: widgetCore.FlatbuttonCoreWidget(
              title: "CRIAR CONTA",
              onPressed: () {
                Modular.to.pushReplacementNamed("/login/novouser");
              },
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Observer(builder: (context) {
            if (controller.status == AppStatus.loading) {
              return widgetCore.RaisedbuttonCoreWidget(
                loading: true,
                icon: Icon(FontAwesomeIcons.user),
                label: "Login com Email",
                colorButton: Colors.blueGrey,
                onPressed: () {},
              );
            } else {
              return widgetCore.RaisedbuttonCoreWidget(
                icon: Icon(FontAwesomeIcons.user),
                label: "Login com Email",
                colorButton: Colors.blueGrey,
                onPressed: () {
                  if (controller.loginFormKey.currentState.validate()) {
                    controller.signInEmailLogin(
                      onSuccess: () {
                        Get.snackbar(
                          "Bem vindo ${controller.authController.currentUserData.nome}",
                          'Login efetuado com sucesso',
                          icon: Icon(FontAwesomeIcons.check),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        Future.delayed(Duration(seconds: 1)).then((_) {
                          Modular.to.pop();
                          Modular.to.pushReplacementNamed("/");
                        });
                      },
                      onFail: () {
                        Get.snackbar(
                          'Olá',
                          'Não foi possível fazer o login',
                          icon: Icon(FontAwesomeIcons.meh),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                    );
                  }
                },
              );
            }
          }),
          SizedBox(
            height: 8.0,
          ),
          widgetCore.RaisedbuttonCoreWidget(
            icon: Icon(FontAwesomeIcons.google),
            label: "Login com Google",
            colorButton: Colors.red,
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
