import 'package:flutter/material.dart';

enum ToastType { info, success, warning, error }

class ToastOverlay {
  static void show(
    BuildContext context,
    String message, {
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color bgColor;
    switch (type) {
      case ToastType.success:
        bgColor = Colors.green;
        break;
      case ToastType.warning:
        bgColor = Colors.orange;
        break;
      case ToastType.error:
        bgColor = Colors.red;
        break;
      case ToastType.info:
      default:
        bgColor = Colors.blue;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: bgColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
