import 'dart:convert';

import 'package:flutter/services.dart';

class Env {
  static Map<String, String> _values;
  static bool _alreadyLoaded = false;

  static bool isProduction() {
    return bool.fromEnvironment('dart.vm.product', defaultValue: false);
  }

  static Future<String> get(String key) async {
    if (!_alreadyLoaded) {
      await _load();
    }

    return _values[key];
  }

  static Future<void> _load() async {
    String contents = await rootBundle.loadString('assets/env/${_getFilename()}.json');
    Map<String, dynamic> jsonMap = json.decode(contents);

    _values = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    _alreadyLoaded = true;
  }

  static String _getFilename() {
    return isProduction() ? 'prod' : 'dev';
  }
}
