import 'package:flutter/material.dart';

Size getSize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double getHeight(BuildContext context) {
  debugPrint('Height = ' + getSize(context).height.toString());
  return getSize(context).height;
}

double getWidth(BuildContext context) {
  debugPrint('Width = ' + getSize(context).width.toString());
  return getSize(context).width;
}