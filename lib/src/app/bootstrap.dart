import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> bootstrap({
  required Widget app,
  required Function injectorApp,
  Future? intFirebase,
  Future? initPersistentStorage,
  Function? configSystemUI,
  Future<void>? configPreferredOrientations,
  Future<void>? crashlytics,
}) async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (intFirebase != null) await intFirebase;

    // set orientations
    configPreferredOrientations ?? preferredOrientations();

    // set style UI system
    configSystemUI != null ? configSystemUI() : systemUI();

    // Dependencies local storage
    if (initPersistentStorage != null) await initPersistentStorage;

    // Dependencies
    injectorApp();

    runApp(
      app,
    );
  }, (error, stackTrace) async {
    if (kDebugMode) {
      // in development, print error and stack trace
      // ignore: avoid_print
      print('$error');

      // ignore: avoid_print
      print('$stackTrace');
    } else {
      // report to a error tracking system in production
    }
  });
  // This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails details) async {
    final dynamic exception = details.exception;
    final StackTrace? stackTrace = details.stack;
    if (kDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone
      // FirebaseCrashlytics.instance.recordFlutterFatalError(details);

      crashlytics!;
      if (stackTrace != null) {
        Zone.current.handleUncaughtError(exception, stackTrace);
      }
    }
  };
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    crashlytics!;
    return true;
  };
}

Future<void> preferredOrientations() {
  // disable disable Landscape mode
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeRight,
    // DeviceOrientation.landscapeLeft,
  ]);
}

void systemUI() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,

      // background status bar
      systemNavigationBarColor: Colors.white,

      // background Navigation
      statusBarIconBrightness: Brightness.dark,

      statusBarBrightness: Brightness.light,

      // set màu cho icon của status bar
      // systemNavigationBarDividerColor: Colors.orangeAccent,
    ),
  );
}
