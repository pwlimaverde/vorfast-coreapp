import 'package:mobx/mobx.dart';
//Importes Internos
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

  //Controles Gerais


  //Controles Internos
  @observable
  List<CategoriasModel> allCateg;

  @action
  Future<void> getAllCategorias() async{
    allCateg = await repo.getAllCategorias();
  }

}
