import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
//Importes Internos
import '../../../../shared/widgets/widgets_core.dart' as widgetCore;
import '../../../../shared/utilitario/app_status.dart';
import 'novo_user_controller.dart';

class NovoUserPage extends StatefulWidget {
  final String title;
  const NovoUserPage({Key key, this.title = "Novo Usuario"}) : super(key: key);

  @override
  _NovoUserPageState createState() => _NovoUserPageState();
}

class _NovoUserPageState
    extends ModularState<NovoUserPage, NovoUserController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return widgetCore.BodyCoreWidget(
      title: "Criar Usuario",
      page: 0,
      card: buildForm(),
    );
  }

  Widget buildForm() {
    return Form(
      key: controller.novoUserFormKey,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          widgetCore.FieldCoreWidget(
            controller: controller.nomeController,
            label: "Nome Completo",
            hint: "Digite o Nome",
            validator: controller.validatorNome,
          ),
          SizedBox(
            height: 16.0,
          ),
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
            height: 16.0,
          ),
          widgetCore.FieldCoreWidget(
            controller: controller.repetirSenhaController,
            label: "Repetir Senha",
            hint: "Repita a Senha",
            keyBoard: TextInputType.emailAddress,
            validator: controller.validatorRepetirSenha,
            obscureText: true,
          ),
          SizedBox(
            height: 16.0,
          ),
          widgetCore.FieldCoreWidget(
            controller: controller.enderecoController,
            label: "Endereço",
            hint: "Digite o endereço",
            validator: controller.validatorEndereco,
          ),
          SizedBox(
            height: 16.0,
          ),
          Observer(builder: (_) {
            if (controller.status == AppStatus.loading) {
              return widgetCore.RaisedbuttonCoreWidget(
                loading: true,
                icon: Icon(FontAwesomeIcons.user),
                label: "Criar Conta",
                colorButton: Colors.blueGrey,
                onPressed: () {},
              );
            } else {
              return widgetCore.RaisedbuttonCoreWidget(
                icon: Icon(FontAwesomeIcons.user),
                label: "Criar Conta",
                colorButton: Colors.blueGrey,
                onPressed: () {
                  if (controller.novoUserFormKey.currentState.validate()) {
                    controller.setUserEmail(
                      onSuccess: () {
                        Get.snackbar(
                          "Bem vindo ${controller.nomeController.text}",
                          'Conta criada com sucesso',
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
                          'Não foi possível criar o usuario',
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
          Observer(
            builder: (_) {
              if (controller.status == AppStatus.error) {
                return Center(
                  child: Text(
                    "Não foi possível criar o usuario => ${controller.status.valorGet}",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
