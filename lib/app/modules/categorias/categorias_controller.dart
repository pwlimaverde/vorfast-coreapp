import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
//Importes Internos
import '../../shared/widgets/drawer_core/drawer_core_controller.dart';
import 'model/categorias_model.dart';
import 'repositories/interfaces/categorias_repository_interface.dart';

part 'categorias_controller.g.dart';

class CategoriasController = _CategoriasControllerBase
    with _$CategoriasController;

abstract class _CategoriasControllerBase with Store {

  final ICategoriasRepository repo;

  _CategoriasControllerBase(this.repo){
    getAllCategorias();
  }


  @observable
  List<CategoriasModel> allCateg;

  @action
  Future<void> getAllCategorias() async{
    allCateg = await repo.getAllCategorias();
  }


  //Controles Gerais
  final controllerDrawer = Modular.get<DrawerCoreController>();

  //Componentes page
  get drawerCore => controllerDrawer.drawerCoreWidget(page: 1);

}
