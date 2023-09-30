
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

Widget flushbarFail(context, {String? text, IconData? icon}) {
  return Flushbar(
    margin: const EdgeInsets.symmetric(
        horizontal: paddingScreen, vertical: 10),
    isDismissible: true,
    borderRadius: BorderRadius.circular(5),
    message: text.toString(),
    icon: Icon(
      icon ?? Icons.info_outline,
      size: 28.0,
      color: DenayaColors.red,
    ),
    duration: const Duration(seconds: 8),
  )..show(context);
}
