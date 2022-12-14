import 'package:flutter/material.dart';

Widget defaultButton({
  required Widget buttonWidget,
  required Function() function,
  double width = double.infinity,
  Color backgroundColor = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
}) {
  return Container(
    width: width,
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: backgroundColor,
    ),
    child: MaterialButton(onPressed: function, child: buttonWidget),
  );
}

Widget defaultTextFromFiled({
  required TextEditingController controller,
  required FormFieldValidator<String>? validate,
  required TextInputType type,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool? isClickable,
  int? lines,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  bool isPassword = false,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    enabled: isClickable,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    onTap: onTap,
    maxLines: lines,
    validator: validate,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefix),
      suffixIcon: suffix != null
          ? IconButton(
              onPressed: suffixPressed,
              icon: Icon(suffix),
            )
          : null,
      border: const OutlineInputBorder(),
    ),
  );
}

// to navigat to page
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => widget,
      ),
      (route) => false,
    );
