// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> uk_UA = {
  "login": {
    "buttonText": "Логін"
  },
  "resetPassword": "Відновити пароль",
  "email": "Eлектронна пошта",
  "password": "Пароль"
};
static const Map<String,dynamic> de_DE = {
  "login": {
    "buttonText": "Anmeldung"
  },
  "resetPassword": "Passwort zurücksetzen",
  "email": "E-Mail",
  "password": "Passwort"
};
static const Map<String,dynamic> en_US = {
  "login": {
    "buttonText": "Login"
  },
  "resetPassword": "Reset password",
  "email": "Email",
  "password": "Password"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"uk_UA": uk_UA, "de_DE": de_DE, "en_US": en_US};
}
