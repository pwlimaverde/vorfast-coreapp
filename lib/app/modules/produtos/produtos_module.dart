import 'pages/detalhes_produto/detalhes_produto_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'pages/detalhes_produto/detalhes_produto_page.dart';
import 'repositories/produtos_repository.dart';
import 'repositories/interfaces/produtos_repository_interface.dart';
import 'produtos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'produtos_page.dart';

class ProdutosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DetalhesProdutoController()),
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
        Router("/detalhes",
            child: (_, args) => DetalhesProdutoPage(
                  model: args.data[0],
                )),
      ];

  static Inject get to => Inject<ProdutosModule>.of();
}
