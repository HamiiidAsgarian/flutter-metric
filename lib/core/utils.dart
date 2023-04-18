import 'package:flutter/material.dart';
import 'package:web_metric/const.dart';

showSnackBar(BuildContext context, String message, SnackbarType type) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: () {
        switch (type) {
          case SnackbarType.add:
            return Colors.blueAccent;
          case SnackbarType.delete:
            return Colors.amber;
          default:
            return Colors.black;
        }
      }(),
      content: Text(message,
          style: Consts.cardTextStyle.copyWith(color: Colors.white))));
}

enum SnackbarType { add, delete }
