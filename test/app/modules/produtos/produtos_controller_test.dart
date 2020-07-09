import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:coreapp/app/modules/produtos/produtos_controller.dart';
import 'package:coreapp/app/modules/produtos/produtos_module.dart';

void main() {
  initModule(ProdutosModule());
  // ProdutosController produtos;
  //
  setUp(() {
    //     produtos = ProdutosModule.to.get<ProdutosController>();
  });

  group('ProdutosController Test', () {
    //   test("First Test", () {
    //     expect(produtos, isInstanceOf<ProdutosController>());
    //   });

    //   test("Set Value", () {
    //     expect(produtos.value, equals(0));
    //     produtos.increment();
    //     expect(produtos.value, equals(1));
    //   });
  });
}
