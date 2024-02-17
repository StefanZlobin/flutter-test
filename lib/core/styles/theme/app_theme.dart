import 'package:flutter/material.dart';

import 'app_bar_theme/app_bar_theme.dart';

abstract final class AppTheme {
  static ThemeData get lightAppTheme {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    );
  }
}
