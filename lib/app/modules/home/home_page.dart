import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
//imports internos
import 'home_controller.dart';
import '../../shared/utilitario/app_status.dart';
import '../../shared/widgets/widgets_core.dart' as widgetCore;

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return widgetCore.BodyCoreWidget(
      page: 1,
      title: "Novidades",
      body: _body(),
    );
  }

  Observer _body() {
    return Observer(builder: (context) {
      if (controller.status == AppStatus.success) {
        if (controller.allPromo.data != null &&
            controller.allPromo.data.length > 0) {
          return widgetCore.SlvGridPromoModelWidget(
              listModel: controller.allPromo.data);
        } else {
          return widgetCore.SlvProgressWidget();
        }
      } else {
        return widgetCore.SlvProgressWidget();
      }
    });
  }
}
