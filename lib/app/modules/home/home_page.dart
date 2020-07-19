import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
//imports internos
import 'home_controller.dart';
import '../../shared/widgets/widgets_core.dart' as widgetCore;

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "VorFast"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return widgetCore.BodyCoreWidget(
        page: 1,
        slv: controller.allSecao.data != null &&
                controller.allSecao.data.length > 0
            ? !controller.isEditeMode
                ? controller.listSlv
                : controller.listSlvEdit
            : [
                widgetCore.SlvAppbarWidget(
                  title: "VorFast",
                  isAdmin: controller.isAdmin,
                ),
                widgetCore.SlvProgressWidget(),
              ],
      );
    });
  }
}
