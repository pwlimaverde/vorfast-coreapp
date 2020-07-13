import 'package:coreapp/app/modules/home/model/secao_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
//Importes Internos
import '../../shared/utilitario/app_status.dart';
import 'model/promo_model.dart';
import 'repositories/interfaces/home_repository_interface.dart';
import '../../shared/auth/auth_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IHomeRepository repo;
  final AuthStore auth;

  _HomeControllerBase({this.repo, this.auth}) {
    getAllPromo();
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
  void getAllPromo() {
    setStatus(AppStatus.loading);
    allPromo = repo.getAllPromo().asObservable();
    setStatus(AppStatus.success);
  }

  @observable
  List<SecaoModel> allSecao;

  @action
  Future<void> getAllSecao() async {
    setStatus(AppStatus.loading);
    allSecao = await repo.getAllSecao();
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
}
