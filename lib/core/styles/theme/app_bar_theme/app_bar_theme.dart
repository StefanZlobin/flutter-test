import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract final class CustomAppBarTheme {
  // To avoid create instance
  CustomAppBarTheme._();

  static const AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
}
