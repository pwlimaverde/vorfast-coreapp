import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//imports internos
import 'home_controller.dart';
import '../../shared/utilitario/app_status.dart';
import '../../shared/widgets/widgets_core.dart' as widgetCore;

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return widgetCore.BodyCoreWidget(
      editButton: observerEditButton(),
      isAdmin: controller.isAdmin,
      page: 1,
      title: "Novidades",
      body: _body(),
    );
  }

  Observer observerEditButton() {
    return Observer(builder: (_) {
      if (controller.isEditeMode) {
        return IconButton(
          icon: Icon(FontAwesomeIcons.check),
          onPressed: () {
            controller.saveCor();
            controller.setEdite(!controller.isEditeMode);
          },
        );
      } else {
        return IconButton(
          icon: Icon(FontAwesomeIcons.pencilAlt),
          onPressed: () {
            controller.setEdite(!controller.isEditeMode);
          },
        );
      }
    });
  }

  Observer _body() {
    return Observer(builder: (context) {
      if (controller.isEditeMode) {
        return widgetCore.SlvAdapterWidget(
          adapter: Container(
            height: 220,
            child: Card(
              child: Form(
                key: controller.coresFormKey,
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: <Widget>[
                    Center(child: Text("Edição das Cores do Tema")),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: widgetCore.FieldCoreWidget(
                            prefix: "# ",
                            controller: controller.primeController,
                            label: "Cor Primaria (#000000)",
                            hint: "Digite o Código da Cor Hexadecimal",
                            validator: controller.validatorCor,
                            maxLength: 6,
                            onChanged: (valor) {
                              controller.setPrime(valor);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Observer(builder: (_) {
                          if (controller.primeEditValido != null &&
                              controller.primeEditValido.length == 6) {
                            return Column(
                              children: <Widget>[
                                Container(
                                  height: 60,
                                  width: 60,
                                  color: Color(int.parse(
                                      "0xff${controller.primeEditValido}")),
                                ),
                                Text(
                                  "Cor nova",
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            );
                          } else {
                            return Column(
                              children: <Widget>[
                                Container(
                                  height: 60,
                                  width: 60,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Text(
                                  "Cor atual",
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            );
                          }
                        }),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: widgetCore.FieldCoreWidget(
                            prefix: "# ",
                            controller: controller.accentController,
                            label: "Cor Secundaria (#000000)",
                            hint: "Digite o Código da Cor Hexadecimal",
                            validator: controller.validatorCor,
                            maxLength: 6,
                            onChanged: (valor) {
                              controller.setAccent(valor);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Observer(builder: (_) {
                          if (controller.accentEditValido != null &&
                              controller.accentEditValido.length == 6) {
                            return Column(
                              children: <Widget>[
                                Container(
                                  height: 60,
                                  width: 60,
                                  color: Color(int.parse(
                                      "0xff${controller.accentEditValido}")),
                                ),
                                Text(
                                  "Cor nova",
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            );
                          } else {
                            return Column(
                              children: <Widget>[
                                Container(
                                  height: 60,
                                  width: 60,
                                  color: Theme.of(context).accentColor,
                                ),
                                Text(
                                  "Cor atual",
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            );
                          }
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        if (controller.status == AppStatus.success) {
          if (controller.allPromo.data != null &&
              controller.allPromo.data.length > 0) {
            return widgetCore.SlvGridPromoModelWidget(
                listModel: controller.allPromo.data);
          } else {
            return widgetCore.SlvProgressWidget();
          }
        } else {
          return widgetCore.SlvProgressWidget();
        }
      }
    });
  }
}
