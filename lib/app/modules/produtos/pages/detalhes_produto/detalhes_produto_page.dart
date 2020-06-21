import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
                  height: 8.0,
                ),
                Observer(builder: (context) {
                  bool st = widget.model.status;
                  return SizedBox(
                    height: (60 * widget.model.opcoes.length).toDouble(),
                    child: ListView.builder(
                      itemCount: widget.model.opcoes.length,
                      itemBuilder: (context, index) {
                        MapEntry<String, dynamic> map = widget
                            .model.opcoes.entries
                            .map((e) => e)
                            .toList()[index];
                        String key = map.key;
                        List values = map.value;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("$key:"),
                            SizedBox(
                              height: 4.0,
                            ),
                            SizedBox(
                              height: 40.0,
                              child: GridView(
                                padding: EdgeInsets.symmetric(vertical: 4.0),
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 8.0,
                                  childAspectRatio: 0.5,
                                ),
                                children: values.map((data) {
                                  return GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          border: Border.all(
                                              color: widget.model.escolhas !=
                                                          null &&
                                                      widget.model.escolhas
                                                          .containsValue(data)
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Colors.grey[500],
                                              width: 3.0)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        data,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    onTap: () {
                                      if (widget.model.escolhas == null) {
                                        widget.model.setStatus(true);
                                        widget.model.escolhas = Map();
                                        widget.model.escolhas[key] = data;
                                        widget.model.setStatus(false);
                                      } else {
                                        widget.model.setStatus(true);
                                        widget.model.escolhas[key] = data;
                                        widget.model.setStatus(false);
                                      }
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }),
                SizedBox(
                  height: 16.0,
                ),
                Observer(builder: (context) {
                  bool st = widget.model.status;
                  bool ativButton = widget.model.escolhas != null &&
                      widget.model.opcoes.length ==
                          widget.model.escolhas.length;
                  return SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                      onPressed: ativButton ? () {} : null,
                      child: Text("Adicionar ao Carrinho",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: ativButton
                                  ? Theme.of(context).accentColor
                                  : Colors.white)),
                    ),
                  );
                }),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Descrição:",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  widget.model.descricao,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                widget.model.fichaTecnica != null?Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Ficha Técnica:",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    SizedBox(
                      height: (60 * widget.model.fichaTecnica.length).toDouble(),
                      child: ListView.builder(
                        itemCount: widget.model.fichaTecnica.length,
                        itemBuilder: (context, index) {
                          MapEntry<String, dynamic> map = widget
                              .model.fichaTecnica.entries
                              .map((e) => e)
                              .toList()[index];
                          String key = map.key;
                          String value = map.value;
                          return Container(
                            alignment: Alignment.centerLeft,
                            color: index%2 > 0 ?Colors.grey[200]:Colors.grey[400],
                            height: 30,
                            child: Text("$key: $value", style: TextStyle(fontSize: 16.0),),
                          );
                        },
                      ),
                    ),
                  ],
                ):Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
