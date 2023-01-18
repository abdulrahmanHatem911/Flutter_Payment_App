import 'package:flutter/material.dart';

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
