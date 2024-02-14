import 'package:flutter/material.dart';

class TextFieldInputSearch extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hintText;
  final TextInputType? textInputType;
  final IconData? icon;

  const TextFieldInputSearch(
      {Key? key,
      this.textEditingController,
      this.hintText,
      this.icon,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hintText,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          suffixIcon: Icon(icon),
          suffixIconColor: Colors.black87,
          contentPadding: const EdgeInsets.all(8)),
      keyboardType: textInputType,
    );
  }
}
