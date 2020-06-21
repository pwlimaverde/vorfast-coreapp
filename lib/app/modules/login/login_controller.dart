import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

//Importes Internos
import '../../shared/widgets/flatbutton_core/flatbutton_core_controller.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  //Controles Gerais
  final controllerFlat = Modular.get<FlatbuttonCoreController>();

  //Componentes page
  get flatCoreCriar => controllerFlat.flatbuttonCoreWidget(
        title: "CRIAR CONTA",
        padding: 8.0,
        fontSize: 12.0,
        onPressed: () {},
      );
  get flatCoreEsqueci => controllerFlat.flatbuttonCoreWidget(
    title: "Esqueci minha senha",
    onPressed: () {},
  );
}
