import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:transparent_image/transparent_image.dart';

//Importes Internos
import '../../model/produtos_model.dart';

class TileProdutosWidget extends StatelessWidget {
  final ProdutosModel model;
  final bool isGrid;

  TileProdutosWidget({this.model, this.isGrid});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Modular.link.pushNamed("/detalhes", arguments: [model]);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: isGrid
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: model.imagens[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            model.nome,
                            style: TextStyle(fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "R\$ ${model.preco.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: model.imagens[0],
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            model.nome,
                            style: TextStyle(fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "R\$ ${model.preco.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
