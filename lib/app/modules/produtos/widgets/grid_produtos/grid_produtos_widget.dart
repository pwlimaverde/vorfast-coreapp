import 'package:flutter/material.dart';
//Importes Internos
import '../../model/produtos_model.dart';
import '../tile_produtos/tile_produtos_widget.dart';

class GridProdutosWidget extends StatelessWidget {
  final List<ProdutosModel> listModel;

  GridProdutosWidget({this.listModel});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(4.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        childAspectRatio: 0.65,
      ),
      itemCount: listModel.length,
      itemBuilder: (context, index){
        return TileProdutosWidget(isGrid: true, model: listModel[index],);
      },
    );
  }
}
