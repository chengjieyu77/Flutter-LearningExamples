import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get _theme => Theme.of(this);
  TextTheme get textTheme => _theme.textTheme;
  ColorScheme get colorScheme => _theme.colorScheme;
  Size get deviceSize => MediaQuery.sizeOf(this);
  Orientation get deviceOrientation => MediaQuery.orientationOf(this);
}
