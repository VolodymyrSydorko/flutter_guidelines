import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidelines/app.dart';
import 'package:flutter_guidelines/generated/codegen_loader.g.dart';
import 'package:flutter_guidelines/services/index.dart';
import 'package:flutter_guidelines/services/injector/injector.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      child: const App(),
      //localization
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('de', 'DE'),
        Locale('uk', 'UA'),
      ],
      path: 'resources/langs',
      fallbackLocale: const Locale('en', 'US'),
      assetLoader: const CodegenLoader(),
    ),
  );
}
