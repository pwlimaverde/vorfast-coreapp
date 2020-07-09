import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
//Importes Internos
import 'repositories/categorias_repository.dart';
import 'repositories/interfaces/categorias_repository_interface.dart';
import 'categorias_controller.dart';
import 'categorias_page.dart';

class CategoriasModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ICategoriasRepository>((i) => CategoriasRepository(Firestore.instance)),
        Bind((i) => CategoriasController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CategoriasPage()),
      ];

  static Inject get to => Inject<CategoriasModule>.of();
}
