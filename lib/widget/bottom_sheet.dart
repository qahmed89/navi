import 'package:flutter/material.dart';
import 'package:navi/widget/vehicles.dart';

void settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (BuildContext bc) {
        // ignore: missing_return

        return VehiclesWidgets();
      });
}
