class NumUtils {
  static num parseNum(dynamic value, [num defaultValue = 0]) {
    if (value != null) {
      if (value is num) {
        return value;
      }

      if (value is String) {
        num numValue = num.tryParse(value);

        if (numValue != null) {
          return numValue;
        }
      }
    }

    return defaultValue;
  }
}
