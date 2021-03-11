import 'package:flutter/material.dart';

Widget button(IconData icon) {
  return FloatingActionButton(
    onPressed: null,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    backgroundColor: Colors.blue,
    child: Icon(
      icon,
      size: 36.0,
    ),
  );
}
