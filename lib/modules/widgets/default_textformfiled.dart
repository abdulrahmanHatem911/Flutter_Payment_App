import 'package:flutter/material.dart';

class DefaultTextFormFiled extends StatelessWidget {
  TextEditingController controller;
  FormFieldValidator<String> validate;
  TextInputType? type;
  String? hintText;
  IconData? prefix;
  bool isPassword = false;
  DefaultTextFormFiled({
    super.key,
    required this.controller,
    required this.validate,
    this.type,
    this.hintText,
    this.prefix,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      validator: validate,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(prefix),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
      ),
    );
  }
}
