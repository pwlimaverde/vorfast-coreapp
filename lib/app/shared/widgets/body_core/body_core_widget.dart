import 'package:flutter/material.dart';
import '../widgets_core.dart' as widgetCore;

class BodyCoreWidget extends StatelessWidget {
  final int page;
  final List<Widget> slv;

  const BodyCoreWidget({
    Key key,
    this.page,
    this.slv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widgetCore.DrawerCoreWidget(page: page),
      body: Stack(
        children: <Widget>[
          widgetCore.GradientebackCoreWidget(),
          CustomScrollView(
            slivers: slv,
          ),
        ],
      ),
    );
  }
}
