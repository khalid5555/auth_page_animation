import 'dart:math';

import 'package:flutter/material.dart';

const double defaultPadding = 16.0;
const Duration defaultDuration = Duration(milliseconds: 400);
final color = Random();
int colors = 0xff000000;
Color recolor() {
  return Color(color.nextInt(colors));
}

showLoading(context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("الرجاء الانتظار "),
          content: SizedBox(
              height: 50,
              child: Center(
                child: CircularProgressIndicator(),
              )),
        );
      });
}
