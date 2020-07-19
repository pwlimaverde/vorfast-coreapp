import '../../model/secao_model.dart';
import 'package:flutter/material.dart';
import '../../../../shared/widgets/widgets_core.dart' as widgetCore;

class AnunciosBuildWidget extends StatelessWidget {
  final SecaoModel secao;

  const AnunciosBuildWidget({Key key, this.secao}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: secao.anuncios,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return widgetCore.SlvGridPromoModelWidget(
              listModel: snapshot.data,
            );
          } else {
            return widgetCore.SlvProgressWidget();
          }
        });
  }
}
