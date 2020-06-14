import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
//imports internos
import 'home_controller.dart';
import '../../shared/utilitario/app_status.dart';
import 'widgets/body_back_home/body_back_home_widget.dart';
import 'widgets/sliv_grid_home/sliv_grid_home_widget.dart';
import 'widgets/sliv_progress_home/sliv_progress_home_widget.dart';
import 'widgets/sliver_appbar_home/sliver_appbar_home_widget.dart';

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
    return Scaffold(
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: () {},
//      ),
      drawer: controller.drawerCore,
      body: Stack(
        children: <Widget>[
          BodyBackHomeWidget(),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppbarHomeWidget("Novidades"),
              Observer(builder: (context) {
                if (controller.status == AppStatus.success) {
                  if (controller.allPromo.data != null &&
                      controller.allPromo.data.length > 0) {
                    return SlivGridHomeWidget(controller.allPromo.data);
                  } else {
                    return SlivProgressHomeWidget();
                  }
                } else {
                  return SlivProgressHomeWidget();
                }
              }),
            ],
          ),
        ],
      ),
    );
  }
}
