import 'package:flutter/material.dart';
import '../../../../shared/widgets/widgets_core.dart' as widgetCore;

class CardEditCorWidget extends StatelessWidget {
  final GlobalKey<FormState> keyForm;
  final String title;
  final Function validador;
  final Function onChangedR;
  final Function onChangedG;
  final Function onChangedB;
  final TextEditingController controllerR;
  final TextEditingController controllerG;
  final TextEditingController controllerB;
  final Widget previewCor;

  const CardEditCorWidget({
    Key key,
    @required this.keyForm,
    @required this.title,
    @required this.validador,
    @required this.onChangedR,
    @required this.onChangedG,
    @required this.onChangedB,
    @required this.controllerR,
    @required this.controllerG,
    @required this.controllerB,
    @required this.previewCor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return widgetCore.SlvAdapterWidget(
      adapter: Container(
        height: 140,
        child: Card(
          child: Form(
            key: keyForm,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                Center(child: Text(title)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: widgetCore.FieldCoreWidget(
                        controller: controllerR,
                        label: "R",
                        hint: "de 0 a 255",
                        validator: validador,
                        maxLength: 3,
                        keyBoard: TextInputType.numberWithOptions(),
                        onChanged: (valor) {
                          if (keyForm.currentState.validate()) {}
                          onChangedR(int.parse(valor));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Expanded(
                      child: widgetCore.FieldCoreWidget(
                        controller: controllerG,
                        label: "G",
                        hint: "de 0 a 255",
                        validator: validador,
                        maxLength: 3,
                        keyBoard: TextInputType.numberWithOptions(),
                        onChanged: (valor) {
                          if (keyForm.currentState.validate()) {}
                          onChangedG(int.parse(valor));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Expanded(
                      child: widgetCore.FieldCoreWidget(
                        controller: controllerB,
                        label: "B",
                        hint: "de 0 a 255",
                        validator: validador,
                        maxLength: 3,
                        keyBoard: TextInputType.numberWithOptions(),
                        onChanged: (valor) {
                          if (keyForm.currentState.validate()) {}
                          onChangedB(int.parse(valor));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    previewCor,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
