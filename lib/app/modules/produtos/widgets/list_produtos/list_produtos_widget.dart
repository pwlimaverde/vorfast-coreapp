import 'package:flutter/material.dart';

//Importes Internos
import '../../model/produtos_model.dart';
import '../tile_produtos/tile_produtos_widget.dart';

class ListProdutosWidget extends StatelessWidget {
  final List<ProdutosModel> listModel;

  ListProdutosWidget({this.listModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(4.0),
      itemCount: listModel.length,
      itemBuilder: (context, index){
        return TileProdutosWidget(isGrid: false, model: listModel[index],);
      },
    );
  }
}
