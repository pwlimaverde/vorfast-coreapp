import 'package:coreapp/app/modules/home/model/secao_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
//Importes Internos
import '../../shared/utilitario/app_status.dart';
import 'componentes/anuncios_build/anuncios_build_widget.dart';
import 'repositories/interfaces/home_repository_interface.dart';
import '../../shared/auth/auth_store.dart';
import '../../shared/widgets/widgets_core.dart' as widgetCore;

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IHomeRepository repo;
  final AuthStore auth;

  _HomeControllerBase({this.repo, this.auth}) {
    getAllSecao();
  }

  final coresFormKey = GlobalKey<FormState>();
  final primeController = TextEditingController();
  final accentController = TextEditingController();

  //Controles Gerais
  @computed
  bool get isAdmin =>
      auth.currentUserData != null ? auth.currentUserData.administrador : false;

  //Controles Internos
  @observable
  String primeEditValido;

  @action
  void setPrime(String valor) => primeEditValido = valor;

  @observable
  String accentEditValido;

  @action
  void setAccent(String valor) => accentEditValido = valor;

  @observable
  AppStatus status = AppStatus.none;

  @action
  setStatus(AppStatus valor) {
    status = valor;
  }

  @observable
  ObservableStream<List<SecaoModel>> allSecao;

  @action
  void getAllSecao() {
    setStatus(AppStatus.loading);
    allSecao = repo.getAllSecao().asObservable();
    setStatus(AppStatus.success);
  }

  @observable
  bool isEditeMode = false;

  @action
  void setEdite(bool value) => isEditeMode = value;

  //Funcoes internas
  String validatorCor(text) {
    if (text.isEmpty || text.length != 6) {
      return "Código da cor inválido";
    } else {
      return null;
    }
  }

  Future<void> saveCor() async {
    if (primeEditValido != null && primeEditValido.length == 6) {
      await repo.saveCor(
        key: "primaryColor",
        cor: int.parse("0xff$primeEditValido"),
        user: auth.currentUser,
      );
    }
    if (accentEditValido != null && accentEditValido.length == 6) {
      await repo.saveCor(
        key: "accentColor",
        cor: int.parse("0xff$accentEditValido"),
        user: auth.currentUser,
      );
    }
  }

  @computed
  List<Widget> get listSlv {
    List<Widget> slv = List<Widget>();
    slv.insert(
        0,
        widgetCore.SlvAppbarWidget(
          editButton: widgetCore.EditbuttonCoreWidget(
            isEditeMode: isEditeMode,
            onPressedEdit: () {
              saveCor();
              setEdite(!isEditeMode);
            },
            onPressedcheck: () {
              setEdite(!isEditeMode);
            },
          ),
          title: "VorFast",
          isAdmin: isAdmin,
        ));
    for (SecaoModel secao in allSecao.data) {
      slv.add(widgetCore.SlvHeaderWidget(
        secao: secao,
        color: Color.fromRGBO(secao.corr, secao.corg, secao.corb, secao.coro),
      ));
      slv.add(AnunciosBuildWidget(
        secao: secao,
      ));
    }
    return slv;
  }

  @computed
  List<Widget> get listSlvEdit {
    List<Widget> slv = List<Widget>();
    slv.insert(
        0,
        widgetCore.SlvAppbarWidget(
          editButton: widgetCore.EditbuttonCoreWidget(
            isEditeMode: isEditeMode,
            onPressedEdit: () {
              saveCor();
              setEdite(!isEditeMode);
            },
            onPressedcheck: () {
              saveCor();
              setEdite(!isEditeMode);
            },
          ),
          title: "VorFast Edit",
          isAdmin: isAdmin,
        ));
    slv.add(_testeRdit());
    for (SecaoModel secao in allSecao.data) {
      slv.add(widgetCore.SlvHeaderWidget(
        secao: secao,
        color: Color.fromRGBO(secao.corr, secao.corg, secao.corb, secao.coro),
      ));
      slv.add(AnunciosBuildWidget(
        secao: secao,
      ));
    }
    return slv;
  }

  Widget _testeRdit() {
    return widgetCore.SlvAdapterWidget(
      adapter: Container(
        height: 220,
        child: Card(
          child: Form(
            key: coresFormKey,
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
                        controller: primeController,
                        label: "Cor Primaria (#000000)",
                        hint: "Digite o Código da Cor Hexadecimal",
                        validator: validatorCor,
                        maxLength: 6,
                        onChanged: (valor) {
                          print(valor);
                          setPrime(valor);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Observer(builder: (_) {
                      if (primeEditValido != null &&
                          primeEditValido.length == 6) {
                        return Column(
                          children: <Widget>[
                            Container(
                              height: 60,
                              width: 60,
                              color: Color(int.parse("0xff$primeEditValido")),
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
                              color: Colors.amber,
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
                        controller: accentController,
                        label: "Cor Secundaria (#000000)",
                        hint: "Digite o Código da Cor Hexadecimal",
                        validator: validatorCor,
                        maxLength: 6,
                        onChanged: (valor) {
                          setAccent(valor);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Observer(builder: (_) {
                      if (accentEditValido != null &&
                          accentEditValido.length == 6) {
                        return Column(
                          children: <Widget>[
                            Container(
                              height: 60,
                              width: 60,
                              color: Color(int.parse("0xff$accentEditValido")),
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
                              color: Colors.amberAccent,
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
  }
}
