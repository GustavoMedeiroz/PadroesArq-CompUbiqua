class Utils {
  static String getFormattedDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  static String getFormattedTime(DateTime date) {
    return "${date.hour}:${date.minute}";
  }

  static String getFormattedDateTime(DateTime date) {
    return "${getFormattedDate(date)} ${getFormattedTime(date)}";
  }

  static String getFormattedCurrency(double value) {
    return "R\$ ${value.toStringAsFixed(2)}";
  }

  static acceptTrueOrElse(bool value, Function onTrue, Function onFalse) {
    value ? onTrue() : onFalse();
  }

  static acceptTrue(bool value, Function onTrue) {
    value && onTrue();
  }

  static acceptFalse(bool value, Function onFalse) {
    !value && onFalse();
  }

}