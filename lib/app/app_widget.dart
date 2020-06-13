import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

//imports internos
import 'shared/theme/theme_controller.dart';

class AppWidget extends StatelessWidget {
  final controllerThem = Modular.get<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: Modular.navigatorKey,
          title: 'VorFast CoreApp',
          theme: controllerThem.themeApp,
          initialRoute: '/',
          onGenerateRoute: Modular.generateRoute,
        );
      }
    );
  }
}
