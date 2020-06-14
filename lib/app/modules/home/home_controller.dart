import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
//Importes Internos
import '../../shared/widgets/drawer_core/drawer_core_controller.dart';
import '../../shared/utilitario/app_status.dart';
import 'model/promo_model.dart';
import 'repositories/interfaces/home_repository_interface.dart';


part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final IHomeRepository repo;

  _HomeControllerBase(this.repo){
    getAllPromo();
  }

  //Controles Gerais
  final controllerDrawer = Modular.get<DrawerCoreController>();

  //Componentes page
  get drawerCore => controllerDrawer.drawerCoreWidget(page: 0);

  @observable
  AppStatus status = AppStatus.none;

  @action
  setStatus(AppStatus valor) {
    status = valor;
  }

  @observable
  ObservableStream<List<PromoModel>> allPromo;

  @action
  void getAllPromo(){
    setStatus(AppStatus.loading);
    allPromo = repo.getAllPromo().asObservable();
    setStatus(AppStatus.success);
  }

}
