import 'package:flutter_modular/flutter_modular.dart';

abstract class IProdutosRepository implements Disposable {
  Future fetchPost();
}
