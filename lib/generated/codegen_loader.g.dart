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
  "hello": "Hello",
  "helloMessage": "Hello {}!",
  "infoMessageNamed": "{} are written in the {lang} language",
  "clickMe": "Click me",
  "login": {
    "buttonLabel": "Login",
    "email": "Email",
    "password": "Password",
    "resetPassword": {
      "buttonLabel": "Reset Password",
      "email": "@:login.email",
      "password": "@:login.password"
    }
  },
  "clicked": {
    "zero": "You clicked {} times!",
    "one": "You clicked {} time!",
    "two": "You clicked {} times!",
    "few": "You clicked {} times!",
    "many": "You clicked {} times!",
    "other": "You clicked {} times!"
  },
  "amount": {
    "zero": "Your amount : {} ",
    "one": "Your amount : {} ",
    "two": "Your amount : {} ",
    "few": "Your amount : {} ",
    "many": "Your amount : {} ",
    "other": "Your amount : {} "
  },
  "gender": {
    "male": "Hi man ;) ",
    "female": "Hello girl :)",
    "withArg": {
      "male": "Hi man ;) {}",
      "female": "Hello girl :) {}"
    }
  }
};
static const Map<String,dynamic> de_DE = {
  "hello": "Hello",
  "helloMessage": "Hello {}!",
  "infoMessageNamed": "{} are written in the {lang} language",
  "clickMe": "Click me",
  "login": {
    "buttonLabel": "Login",
    "email": "Email",
    "password": "Password",
    "resetPassword": {
      "buttonLabel": "Reset Password",
      "email": "@:login.email",
      "password": "@:login.password"
    }
  },
  "clicked": {
    "zero": "You clicked {} times!",
    "one": "You clicked {} time!",
    "two": "You clicked {} times!",
    "few": "You clicked {} times!",
    "many": "You clicked {} times!",
    "other": "You clicked {} times!"
  },
  "amount": {
    "zero": "Your amount : {} ",
    "one": "Your amount : {} ",
    "two": "Your amount : {} ",
    "few": "Your amount : {} ",
    "many": "Your amount : {} ",
    "other": "Your amount : {} "
  },
  "gender": {
    "male": "Hi man ;) ",
    "female": "Hello girl :)",
    "withArg": {
      "male": "Hi man ;) {}",
      "female": "Hello girl :) {}"
    }
  }
};
static const Map<String,dynamic> en_US = {
  "hello": "Hello",
  "helloMessage": "Hello {}!",
  "infoMessageNamed": "{} are written in the {lang} language",
  "clickMe": "Click me",
  "login": {
    "buttonLabel": "Login",
    "email": "Email",
    "password": "Password",
    "resetPassword": {
      "buttonLabel": "Reset Password",
      "email": "@:login.email",
      "password": "@:login.password"
    }
  },
  "clicked": {
    "zero": "You clicked {} times!",
    "one": "You clicked {} time!",
    "two": "You clicked {} times!",
    "few": "You clicked {} times!",
    "many": "You clicked {} times!",
    "other": "You clicked {} times!"
  },
  "amount": {
    "zero": "Your amount : {} ",
    "one": "Your amount : {} ",
    "two": "Your amount : {} ",
    "few": "Your amount : {} ",
    "many": "Your amount : {} ",
    "other": "Your amount : {} "
  },
  "gender": {
    "male": "Hi man ;) ",
    "female": "Hello girl :)",
    "withArg": {
      "male": "Hi man ;) {}",
      "female": "Hello girl :) {}"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"uk_UA": uk_UA, "de_DE": de_DE, "en_US": en_US};
}
