import 'package:coreapp/app/modules/categorias/model/categorias_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

//Importes Internos
import 'categorias_controller.dart';
import 'widgets/tile_categorias/tile_categorias_widget.dart';

class CategoriasPage extends StatefulWidget {
  final String title;

  const CategoriasPage({Key key, this.title = "Categorias"}) : super(key: key);

  @override
  _CategoriasPageState createState() => _CategoriasPageState();
}

class _CategoriasPageState
    extends ModularState<CategoriasPage, CategoriasController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: controller.drawerCore,
      backgroundColor: Colors.white,
      body: Observer(builder: (_) {
        if (controller.allCateg != null && controller.allCateg.length > 0) {
          return ListView.builder(
            itemCount: controller.allCateg.length,
            itemBuilder: (context, index){
              CategoriasModel model = controller.allCateg[index];
              return TileCategoriasWidget(model: model);
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
