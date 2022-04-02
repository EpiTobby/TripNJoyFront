import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(this.locale);
  final Locale fallbackLocale = const Locale('en');

  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations get instance => _AppLocalizationsDelegate.instance!;

  final Locale locale;
  Map _localizedStrings = {};
  Map _fallbackLocalizedStrings = {};

  Future<void> load() async {
    _localizedStrings = await _loadLocalizedStrings(locale);
    _fallbackLocalizedStrings = {};

    if (locale != fallbackLocale) {
      _fallbackLocalizedStrings = await _loadLocalizedStrings(fallbackLocale);
    }
  }

  Future<Map> _loadLocalizedStrings(Locale localeToBeLoaded) async {
    String jsonString;
    Map localizedStrings = {};

    try {
      jsonString = await rootBundle
          .loadString('assets/locales/${localeToBeLoaded.languageCode}.json');
    } catch (exception) {
      return localizedStrings;
    }

    Map jsonMap = json.decode(jsonString);

    return jsonMap;
  }

  dynamic foldNestedJson(List<String> keys, Map localizedStrings) {
    String firstKey = keys.first;

    dynamic translateWord = _localizedStrings[firstKey];

    if (translateWord.runtimeType == String) {
      return translateWord;
    }

    for (var i = 1; i < keys.length; i++) {
      translateWord = translateWord[keys[i]];
    }

    return translateWord;
  }

  String translate(String key, [Map<String, String>? arguments]) {
    List<String> keys = key.split('.');

    dynamic foldedTranslation = foldNestedJson(keys, _localizedStrings) ??
        foldNestedJson(keys, _fallbackLocalizedStrings);

    String translation =
        foldedTranslation != null ? foldedTranslation.toString() : "";

    if (arguments == null || arguments.isEmpty) {
      return translation;
    }

    arguments.forEach((argumentKey, value) {
      translation = translation.replaceAll("\$$argumentKey", value);
    });

    return translation;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  static AppLocalizations? instance;

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();

    instance = localizations;

    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
