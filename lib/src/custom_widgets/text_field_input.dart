import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hintText;
  final String? label;
  final bool isPass;
  final TextInputType? textInputType;
  final String? Function(String? value)? validator;

  const TextFieldInput({
    Key? key,
    this.textEditingController,
    this.hintText,
    this.textInputType,
    this.isPass = false,
    this.label,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
          labelText: label ?? "",
          hintText: hintText,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
      validator: validator,
    );
  }
}
