import 'package:flutter/material.dart';

class Nav {
  static Future push(Widget className, BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => className,
      ),
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(
      context,
    );
  }

  static Future pushAndRemoveUntil(
      Widget className, BuildContext context) async {
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => className,
      ),
      (route) => false,
    );
  }

  static Future pushReplacement(Widget className, BuildContext context) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => className,
      ),
    );
  }
}
