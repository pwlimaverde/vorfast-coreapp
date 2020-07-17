import 'package:coreapp/app/modules/home/model/secao_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
//Importes Internos
import '../../shared/utilitario/app_status.dart';
import 'model/promo_model.dart';
import 'repositories/interfaces/home_repository_interface.dart';
import '../../shared/auth/auth_store.dart';
import '../../shared/widgets/widgets_core.dart' as widgetCore;

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IHomeRepository repo;
  final AuthStore auth;

  _HomeControllerBase({this.repo, this.auth}) {
    getAllPromo();
    print("vindo do controller teste");
    getAllSecao();
  }

  final coresFormKey = GlobalKey<FormState>();
  final primeController = TextEditingController();
  final accentController = TextEditingController();

  //Controles Gerais

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

  @computed
  bool get isAdmin =>
      auth.currentUserData != null ? auth.currentUserData.administrador : false;

  @observable
  ObservableStream<List<PromoModel>> allPromo;

  @action
  getAllPromo() {
    setStatus(AppStatus.loading);
    allPromo = repo.getAllPromo().asObservable();
    setStatus(AppStatus.success);
  }

  @observable
  ObservableStream<List<SecaoModel>> allSecao;

  @action
  void getAllSecao() {
    print("vindo do controller all inicio");
    setStatus(AppStatus.loading);
    allSecao = repo.getAllSecao().asObservable();
    setStatus(AppStatus.success);
    print("vindo do controller all fim");
    print("vindo do controller dados ${allSecao.value}");
  }

  // @computed
  // List<Future<SecaoModel>> get allSecaoF =>
  //     allSecao != null && allSecao.value.length > 0
  //         ? allSecao.value.map((value) async {
  //             List<PromoModel> e2 = await repo.getPromo(value.reference);
  //             value.anuncios = e2;
  //             return value;
  //           }).toList()
  //         : [];

  // List<SecaoModel> getAnuncios() {
  //   List<SecaoModel> listOk = [];
  //   for (SecaoModel secao in allSecao.value) {
  //     secao.anuncios = await repo.getPromo(secao.reference);
  //     listOk.add(secao);
  //   }
  //   print("vindo do controller computed $listOk");
  //   return listOk;
  // }

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

  Observer observerEditButton() {
    return Observer(builder: (_) {
      if (isEditeMode) {
        return IconButton(
          icon: Icon(FontAwesomeIcons.check),
          onPressed: () {
            saveCor();
            setEdite(!isEditeMode);
          },
        );
      } else {
        return IconButton(
          icon: Icon(FontAwesomeIcons.pencilAlt),
          onPressed: () {
            setEdite(!isEditeMode);
          },
        );
      }
    });
  }

  // @observable
  // ObservableList<Widget> slvWidget = ObservableList<Widget>();

  // @action
  // void setWidget(Widget slv) {
  //   slvWidget.add(slv);
  // }
}
