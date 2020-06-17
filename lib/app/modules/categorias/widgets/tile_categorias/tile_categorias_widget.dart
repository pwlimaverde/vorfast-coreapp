import 'package:flutter/material.dart';

//Importes Internos
import '../../model/categorias_model.dart';

class TileCategoriasWidget extends StatelessWidget {

  final CategoriasModel model;
  final Function onTap;

  TileCategoriasWidget({this.model, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.8,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(model.icon),
          ),
          title: Text(model.title),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: onTap,
        ),
      ),
    );
  }
}
