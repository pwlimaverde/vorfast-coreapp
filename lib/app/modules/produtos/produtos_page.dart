import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

//Importes Internos
import 'model/produtos_model.dart';
import 'produtos_controller.dart';
import '../categorias/model/categorias_model.dart';
import '../../shared/local_storage/local_storage.dart';
import 'widgets/grid_produtos/grid_produtos_widget.dart';
import 'widgets/list_produtos/list_produtos_widget.dart';

class ProdutosPage extends StatefulWidget {
  final CategoriasModel categoria;

  const ProdutosPage({Key key, this.categoria}) : super(key: key);

  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends ModularState<ProdutosPage, ProdutosController>
    with SingleTickerProviderStateMixin<ProdutosPage> {
  //use 'controller' variable to access controller

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTabs();
    controller.getProdCateg(categoria: widget.categoria);
  }

  Future _initTabs() async {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = await LocalStorage.getValue<int>("opstabIndex");
    _tabController.addListener(() {
      LocalStorage.setValue<int>("opstabIndex", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoria.title),
        centerTitle: true,
        actions: <Widget>[
          Container(
            width: 100,
            child: _tabBar(),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (controller.prodCategoria.data != null &&
              controller.prodCategoria.data.length > 0) {
            return _tabBarView();
          } else if (controller.prodCategoria.data != null &&
              controller.prodCategoria.data.length == 0) {
            return Center(child: Text("Nenhum produto encontrado."));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  _tabBar() {
    return TabBar(
        controller: _tabController,
        tabs: [
          Tab(
            icon: Icon(Icons.grid_on),
          ),
          Tab(
            icon: Icon(Icons.list),
          ),
        ]);
  }

  _tabBarView() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        GridProdutosWidget(listModel: controller.prodCategoria.data,),
        ListProdutosWidget(listModel: controller.prodCategoria.data,),
      ],
    );
  }
}
