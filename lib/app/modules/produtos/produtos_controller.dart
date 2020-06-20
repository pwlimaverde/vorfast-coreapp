import 'package:mobx/mobx.dart';
//Importes Internos
import 'repositories/interfaces/produtos_repository_interface.dart';
import 'model/produtos_model.dart';
import '../../shared/utilitario/app_status.dart';
import '../categorias/model/categorias_model.dart';

part 'produtos_controller.g.dart';

class ProdutosController = _ProdutosControllerBase with _$ProdutosController;

abstract class _ProdutosControllerBase with Store {

  final IProdutosRepository repo;

  _ProdutosControllerBase(this.repo);

  @observable
  AppStatus status = AppStatus.none;

  @action
  setStatus(AppStatus valor) {
    status = valor;
  }

  @observable
  ObservableStream<List<ProdutosModel>> prodCategoria;

  @action
  void getProdCateg({CategoriasModel categoria}){
    setStatus(AppStatus.loading);
    prodCategoria = repo.getProdCateg(categoria: categoria).asObservable();
    print("lista ${prodCategoria.value}");
    setStatus(AppStatus.success);
  }

}
