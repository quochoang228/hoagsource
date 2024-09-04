import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.builder,
    required this.supportedLocales,
    this.themeData,
    this.routerConfig,
    this.localizationsDelegates,
  });

  final TransitionBuilder builder;
  final ThemeData? themeData;
  final RouterConfig<Object>? routerConfig;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: themeData,
      builder: builder,
      debugShowCheckedModeBanner: false,
      routerConfig: routerConfig,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }
}
