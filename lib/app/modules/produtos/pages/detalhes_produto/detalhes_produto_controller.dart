import 'package:mobx/mobx.dart';

part 'detalhes_produto_controller.g.dart';

class DetalhesProdutoController = _DetalhesProdutoControllerBase
    with _$DetalhesProdutoController;

abstract class _DetalhesProdutoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
