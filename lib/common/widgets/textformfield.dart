import 'package:flutter/material.dart';

class UiTextFormField extends StatelessWidget {
  bool? obscuredText = false;
  FocusNode? focusNode;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  String? label;
  String? errorHint;
  ValueChanged? onChang;

  UiTextFormField({
    this.obscuredText,
    this.focusNode,
    this.textInputType,
    this.textInputAction,
    this.label,
    this.errorHint,
    this.onChang,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuredText ?? false,
      focusNode: focusNode,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      decoration: InputDecoration(labelText: label, errorText: errorHint),
      onChanged: onChang,
    );
  }
}
