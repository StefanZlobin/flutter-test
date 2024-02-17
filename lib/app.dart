import 'package:flutter/material.dart';
import 'package:forestvpn_test/core/router/app_router.dart';
import 'package:forestvpn_test/core/styles/theme/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter appRouter;

  @override
  void initState() {
    super.initState();
    appRouter = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.goRouter,
      theme: AppTheme.lightAppTheme,
    );
  }
}
