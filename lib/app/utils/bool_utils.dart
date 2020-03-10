import 'package:flutterweather/app/utils/num_utils.dart';

class BoolUtils {
  static bool parseBool(dynamic value, [bool defaultValue = false]) {
    if (value != null) {
      if (value is bool) {
        return value;
      }

      if (value is num) {
        return value != 0;
      } else if (value is String) {
        switch (value.toLowerCase()) {
          case "true":
            return true;

          case "false":
            return false;
        }

        num numValue = NumUtils.parseNum(value);

        if (numValue != null) {
          return numValue != 0;
        }
      }
    }

    return defaultValue;
  }
}
