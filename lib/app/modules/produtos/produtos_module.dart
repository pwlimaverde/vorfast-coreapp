import 'package:cloud_firestore/cloud_firestore.dart';

import 'repositories/produtos_repository.dart';
import 'repositories/interfaces/produtos_repository_interface.dart';
import 'produtos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'produtos_page.dart';

class ProdutosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IProdutosRepository>(
            (i) => ProdutosRepository(Firestore.instance)),
        Bind((i) => ProdutosController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ProdutosPage(
                  categoria: args.data,
                )),
      ];

  static Inject get to => Inject<ProdutosModule>.of();
}
