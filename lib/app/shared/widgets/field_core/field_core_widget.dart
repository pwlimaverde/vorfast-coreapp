import 'package:flutter/material.dart';

class FieldCoreWidget extends StatelessWidget {
  final Function validator;
  final String label;
  final String hint;
  final TextInputType keyBoard;
  final bool obscureText;
  final TextEditingController controller;

  const FieldCoreWidget(
      {Key key,
      this.validator,
      this.label,
      this.hint,
      this.keyBoard,
      this.obscureText,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
      ),
      controller: controller,
      keyboardType: keyBoard,
      validator: validator,
      obscureText: obscureText ?? false,
    );
  }
}
