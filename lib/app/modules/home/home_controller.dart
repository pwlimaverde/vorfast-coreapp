import 'package:coreapp/app/modules/home/componentes/preview_edit_cor/preview_edit_cor_widget.dart';
import 'package:coreapp/app/modules/home/model/secao_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
//Importes Internos
import '../../shared/utilitario/app_status.dart';
import 'componentes/anuncios_build/anuncios_build_widget.dart';
import 'componentes/card_edit_cor/card_edit_cor_widget.dart';
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

  final coresPrimaryFormKey = GlobalKey<FormState>();
  final coresAccentFormKey = GlobalKey<FormState>();
  // final primeController = TextEditingController();
  final primeRController = TextEditingController();
  final primeGController = TextEditingController();
  final primeBController = TextEditingController();
  // final accentController = TextEditingController();
  final accentRController = TextEditingController();
  final accentGController = TextEditingController();
  final accentBController = TextEditingController();

  //Controles Gerais
  @computed
  bool get isAdmin =>
      auth.currentUserData != null ? auth.currentUserData.administrador : false;

  //Controles Internos
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
    if (text.isEmpty || int.parse(text) > 255) {
      return "Valor inválido";
    } else {
      return null;
    }
  }

  Future<void> saveCor() async {
    if (primeREditValido != null &&
        primeGEditValido != null &&
        primeBEditValido != null) {
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
    if (accentREditValido != null &&
        accentGEditValido != null &&
        accentBEditValido != null) {
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
              saveCor();
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
    slv.add(CardEditCorWidget(
      keyForm: coresPrimaryFormKey,
      title: "Edição das Cores Primarias2",
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
        secao: secao,
        color: Color.fromRGBO(secao.corr, secao.corg, secao.corb, secao.coro),
      ));
      slv.add(AnunciosBuildWidget(
        secao: secao,
      ));
    }
    return slv;
  }
}
