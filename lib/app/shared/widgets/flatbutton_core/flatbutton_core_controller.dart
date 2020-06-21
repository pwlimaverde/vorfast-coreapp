import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import 'flatbutton_core_widget.dart';

part 'flatbutton_core_controller.g.dart';

class FlatbuttonCoreController = _FlatbuttonCoreControllerBase
    with _$FlatbuttonCoreController;

abstract class _FlatbuttonCoreControllerBase with Store {
  Widget flatbuttonCoreWidget({
    double padding,
    String title,
    double fontSize,
    Function onPressed,
  }) {
    return FlatbuttonCoreWidget(
      padding: padding,
      title: title,
      fontSize: fontSize,
      onPressed: onPressed,
    );
  }
}
