import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detalhes_produto_controller.dart';

//Importes Internos
import '../../model/produtos_model.dart';

class DetalhesProdutoPage extends StatefulWidget {
  final String title;
  final ProdutosModel model;

  const DetalhesProdutoPage(
      {Key key, this.title = "DetalhesProduto", this.model})
      : super(key: key);

  @override
  _DetalhesProdutoPageState createState() => _DetalhesProdutoPageState();
}

class _DetalhesProdutoPageState
    extends ModularState<DetalhesProdutoPage, DetalhesProdutoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.nome),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: widget.model.imagens.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 6.0,
              dotSpacing: 20.0,
//              dotBgColor: Colors.transparent,
//              dotColor: Theme.of(context).accentColor,
//              dotIncreasedColor: Theme.of(context).accentColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  widget.model.nome,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${widget.model.preco.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  maxLines: 3,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Opções:",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                ),
                SizedBox(
                  height: 34.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(
                      vertical: 4.0
                    ),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.5,
                    ),
                    children: widget.model.opcoes.map((e){
                      return Text("${e}");
                    }).toList(),
                  ),
                ),

//                Container(
//                  height: 300,
//                  child: ListView.builder(
//                    itemCount: widget.model.detalhes.length,
//                    itemBuilder: (context, index){
//                      return ListTile(
//                        title: Text("${widget.model.detalhes[index]}"),
//                      );
//                    },
//                  ),
//                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
