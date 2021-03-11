import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void ShowAlart(
    {BuildContext context,
    DialogType dialogType,
    String title,
    String desc,
    Color color}) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.BOTTOMSLIDE,
    title: title,
    desc: desc,
    btnOkColor: color,
    btnOkOnPress: () {},
  )..show();
}
