import 'package:mobx/mobx.dart';
//Importes Internos
import 'drawer_core_widget.dart';

part 'drawer_core_controller.g.dart';

class DrawerCoreController = _DrawerCoreControllerBase
    with _$DrawerCoreController;

abstract class _DrawerCoreControllerBase with Store {

  drawerCoreWidget({int page}){
    return DrawerCoreWidget(
      page: page,
    );
  }

}
