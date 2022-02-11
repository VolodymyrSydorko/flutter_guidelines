import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidelines/app.dart';
import 'package:flutter_guidelines/generated/codegen_loader.g.dart';
import 'package:flutter_guidelines/services/index.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
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
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      assetLoader: const CodegenLoader(),
    ),
  );
}
