import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class DialogManagement {
  static final DialogManagement _functions = DialogManagement._init();
  factory DialogManagement() {
    return _functions;
  }
  DialogManagement._init();

  bool _isShowing = false;

  showFlushBar(BuildContext context,
      {String title = "", String message = "", int second = 3}) async {
    await Future.delayed(const Duration(milliseconds: 250));
    if (!_isShowing) {
      _isShowing = true;
      await Flushbar(
        margin: const EdgeInsets.all(10),
        title: title,
        message: message,
        duration: Duration(seconds: second),
        backgroundColor:
            Theme.of(context).snackBarTheme.backgroundColor ?? Colors.white,
        flushbarPosition: FlushbarPosition.TOP,
        titleColor: Theme.of(context).snackBarTheme.actionTextColor,
        messageColor: Theme.of(context).snackBarTheme.actionTextColor,
      ).show(context);
      _isShowing = false;
    }
    return;
  }
}
