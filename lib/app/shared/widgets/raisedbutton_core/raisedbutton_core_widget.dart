import 'package:flutter/material.dart';

class RaisedbuttonCoreWidget extends StatelessWidget {
  final double height;
  final Icon icon;
  final Color colorText;
  final Color colorButton;
  final String label;
  final Function onPressed;

  const RaisedbuttonCoreWidget(
      {Key key,
      this.height,
      this.icon,
      this.colorText,
      this.colorButton,
      this.label,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 44.0,
      child: RaisedButton.icon(
        textColor: colorText??Colors.white,
        icon: icon,
        color: colorButton??Colors.blue,
        label: Text(label),
        onPressed: onPressed,
      ),
    );
  }
}
