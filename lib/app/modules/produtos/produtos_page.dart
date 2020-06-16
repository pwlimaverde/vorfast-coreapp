import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'produtos_controller.dart';

class ProdutosPage extends StatefulWidget {
  final String title;
  const ProdutosPage({Key key, this.title = "Produtos"}) : super(key: key);

  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState
    extends ModularState<ProdutosPage, ProdutosController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
