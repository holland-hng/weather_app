class FormatDate {
  static String format(String input) {
    if (input.length == 1) {
      return "0" + input;
    } else {
      return input;
    }
  }
}
