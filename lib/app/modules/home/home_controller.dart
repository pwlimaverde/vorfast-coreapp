import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
//Importes Internos
import '../../shared/utilitario/app_status.dart';
import 'componentes/anuncios_build/anuncios_build_widget.dart';
import 'componentes/card_edit_cor/card_edit_cor_widget.dart';
import 'componentes/container_edit_cor/container_edit_cor_widget.dart';
import 'repositories/interfaces/home_repository_interface.dart';
import '../../shared/auth/auth_store.dart';
import 'componentes/preview_edit_cor/preview_edit_cor_widget.dart';
import 'model/secao_model.dart';
import '../../shared/theme/model/theme_model.dart';
import '../../shared/widgets/widgets_core.dart' as widgetCore;

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IHomeRepository repo;
  final AuthStore auth;

  _HomeControllerBase({this.repo, this.auth}) {
    getAllSecao();
    getThemeConfig();
  }

  final coresPrimaryFormKey = GlobalKey<FormState>();
  final coresAccentFormKey = GlobalKey<FormState>();
  final coresHeaderFormKey = GlobalKey<FormState>();

  final primeRController = TextEditingController();
  final primeGController = TextEditingController();
  final primeBController = TextEditingController();

  final accentRController = TextEditingController();
  final accentGController = TextEditingController();
  final accentBController = TextEditingController();

  final headerRController = TextEditingController();
  final headerGController = TextEditingController();
  final headerBController = TextEditingController();
  final headerOController = TextEditingController();

  //Controles Gerais
  @computed
  bool get isAdmin =>
      auth.currentUserData != null ? auth.currentUserData.administrador : false;

  //Controles Internos
  //Troca de cores Primary
  @observable
  int primeREditValido;

  @action
  void setPrimeR(int valor) => primeREditValido = valor;

  @observable
  int primeGEditValido;

  @action
  void setPrimeG(int valor) => primeGEditValido = valor;

  @observable
  int primeBEditValido;

  @action
  void setPrimeB(int valor) => primeBEditValido = valor;

  @computed
  bool get isPrimary {
    return primeREditValido != null &&
        primeGEditValido != null &&
        primeBEditValido != null;
  }

  @computed
  Color get corPrymary {
    return Color.fromRGBO(
      primeREditValido,
      primeGEditValido,
      primeBEditValido,
      1,
    );
  }

  //Troca de cores Accent
  @observable
  int accentREditValido;

  @action
  void setAccentR(int valor) => accentREditValido = valor;

  @observable
  int accentGEditValido;

  @action
  void setAccentG(int valor) => accentGEditValido = valor;

  @observable
  int accentBEditValido;

  @action
  void setAccentB(int valor) => accentBEditValido = valor;

  @computed
  bool get isAccent {
    return accentREditValido != null &&
        accentGEditValido != null &&
        accentBEditValido != null;
  }

  @computed
  Color get corAccent {
    return Color.fromRGBO(
      accentREditValido,
      accentGEditValido,
      accentBEditValido,
      1,
    );
  }

  //Troca de cores Header
  @observable
  int headerREditValido;

  @action
  void setHeaderR(int valor) => headerREditValido = valor;

  @observable
  int headerGEditValido;

  @action
  void setHeaderG(int valor) => headerGEditValido = valor;

  @observable
  int headerBEditValido;

  @action
  void setHeaderB(int valor) => headerBEditValido = valor;

  @observable
  int headerOEditValido;

  @action
  void setHeaderO(int valor) => headerOEditValido = valor;

  @computed
  bool get isHeader {
    return headerREditValido != null &&
        headerGEditValido != null &&
        headerBEditValido != null &&
        headerOEditValido != null;
  }

  @computed
  Color get corHeader {
    return Color.fromARGB(
      headerOEditValido,
      headerREditValido,
      headerGEditValido,
      headerBEditValido,
    );
  }

  //Conttoles Page
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
  ObservableFuture<ThemeModel> theme;

  @action
  void getThemeConfig() {
    setStatus(AppStatus.loading);
    theme = repo.getThemeConfig().asObservable();
    theme.then((value) {
      primeRController.text = value.primaryR.toString();
      primeGController.text = value.primaryG.toString();
      primeBController.text = value.primaryB.toString();
      setPrimeR(value.primaryR);
      setPrimeG(value.primaryG);
      setPrimeB(value.primaryB);

      accentRController.text = value.accentR.toString();
      accentGController.text = value.accentG.toString();
      accentBController.text = value.accentB.toString();
      setAccentR(value.accentR);
      setAccentG(value.accentG);
      setAccentB(value.accentB);
    });
    setStatus(AppStatus.success);
  }

  @observable
  bool isEditeMode = false;

  @action
  void setEdite(bool value) => isEditeMode = value;

  @computed
  List<Widget> get listSlv {
    List<Widget> slv = List<Widget>();
    slv.insert(
        0,
        widgetCore.SlvAppbarWidget(
          editButton: widgetCore.EditbuttonCoreWidget(
            isEditeMode: isEditeMode,
            onPressedEdit: () {
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
        color: Color.fromARGB(secao.corO, secao.corR, secao.corG, secao.corB),
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
    slv.add(CardEditCorWidget(
      keyForm: coresPrimaryFormKey,
      title: "Edição das Cores Primarias",
      validador: validatorCor,
      onChangedR: setPrimeR,
      onChangedG: setPrimeG,
      onChangedB: setPrimeB,
      controllerR: primeRController,
      controllerG: primeGController,
      controllerB: primeBController,
      previewCor: PreviewEditCorWidget(
        cor: isPrimary ? corPrymary : Get.theme.primaryColor,
        title: isPrimary ? "Cor nova" : "Cor atual",
      ),
    ));
    slv.add(CardEditCorWidget(
      keyForm: coresAccentFormKey,
      title: "Edição das Cores Secundarias",
      validador: validatorCor,
      controllerR: accentRController,
      controllerG: accentGController,
      controllerB: accentBController,
      onChangedR: setAccentR,
      onChangedG: setAccentG,
      onChangedB: setAccentB,
      previewCor: PreviewEditCorWidget(
        cor: isAccent ? corAccent : Get.theme.accentColor,
        title: isAccent ? "Cor nova" : "Cor atual",
      ),
    ));
    for (SecaoModel secao in allSecao.data) {
      slv.add(widgetCore.SlvHeaderWidget(
        onTap: () {
          headerRController.text = secao.corR.toString();
          headerGController.text = secao.corG.toString();
          headerBController.text = secao.corB.toString();
          headerOController.text = secao.corO.toString();
          setHeaderR(secao.corR);
          setHeaderG(secao.corG);
          setHeaderB(secao.corB);
          setHeaderO(secao.corO);
          Get.bottomSheet(Observer(builder: (_) {
            return Container(
              height: 200,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  widgetCore.EditbuttonCoreWidget(
                    isEditeMode: isEditeMode,
                    onPressedEdit: () {},
                    onPressedcheck: () {
                      saveCorHeader(doc: secao.reference.documentID);
                    },
                  ),
                  ContainerEditCorWidget(
                    keyForm: coresHeaderFormKey,
                    title: "Edição das Cores Header ${secao.nome}",
                    validador: validatorCor,
                    onChangedR: setHeaderR,
                    onChangedG: setHeaderG,
                    onChangedB: setHeaderB,
                    onChangedO: setHeaderO,
                    controllerR: headerRController,
                    controllerG: headerGController,
                    controllerB: headerBController,
                    controllerO: headerOController,
                    previewCor: PreviewEditCorWidget(
                      cor: isHeader
                          ? corHeader
                          : Color.fromARGB(
                              secao.corO, secao.corR, secao.corG, secao.corB),
                      title: isHeader ? "Cor nova" : "Cor atual",
                    ),
                  ),
                ],
              ),
            );
          }));
        },
        secao: secao,
        color: Color.fromARGB(secao.corO, secao.corR, secao.corG, secao.corB),
      ));

      slv.add(AnunciosBuildWidget(
        secao: secao,
      ));
    }
    return slv;
  }

  //Funcoes internas
  String validatorCor(text) {
    if (text.isEmpty || int.parse(text) > 255) {
      return "Valor inválido";
    } else {
      return null;
    }
  }

  Future<void> saveCor() async {
    if (isPrimary) {
      await repo.saveCor(
        keyR: "primaryR",
        corR: primeREditValido,
        keyG: "primaryG",
        corG: primeGEditValido,
        keyB: "primaryB",
        corB: primeBEditValido,
        user: auth.currentUser,
      );
    }
    if (isAccent) {
      await repo.saveCor(
        keyR: "accentR",
        corR: accentREditValido,
        keyG: "accentG",
        corG: accentGEditValido,
        keyB: "accentB",
        corB: accentBEditValido,
        user: auth.currentUser,
      );
    }
  }

  Future<void> saveCorHeader({@required String doc}) async {
    if (isHeader) {
      Modular.to.pop();
      await repo.saveCorHeader(
        doc: doc,
        keyR: "corR",
        corR: headerREditValido,
        keyG: "corG",
        corG: headerGEditValido,
        keyB: "corB",
        corB: headerBEditValido,
        keyO: "corO",
        corO: headerOEditValido,
        user: auth.currentUser,
      );
      headerRController.clear();
      headerGController.clear();
      headerBController.clear();
      headerOController.clear();
      headerREditValido = null;
      headerGEditValido = null;
      headerBEditValido = null;
      headerOEditValido = null;
    }
  }
}
