import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
//Importes Internos
import 'model/produtos_model.dart';
import 'produtos_controller.dart';
import '../categorias/model/categorias_model.dart';

class ProdutosPage extends StatefulWidget {

  final CategoriasModel categoria;

  const ProdutosPage({Key key, this.categoria})
      : super(key: key);

  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState
    extends ModularState<ProdutosPage, ProdutosController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getProdCateg(categoria: widget.categoria);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoria.title),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_){
          if(controller.prodCategoria.data != null && controller.prodCategoria.data.length > 0){
            return Center(
              child: ListView.builder(
                itemCount: controller.prodCategoria.data.length,
                itemBuilder: (context, index){
                  ProdutosModel model = controller.prodCategoria.data[index];
                  return ListTile(
                    title: Text("Nome - ${model.nome}"),
                  );
                },
              ),
            );
          }else if(controller.prodCategoria.data != null && controller.prodCategoria.data.length == 0){
            return Center(child: Text("Nenhum produto encontrado."));
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
