class FormatDate {
  static String getTimeInYMD(DateTime date) {
    String ans = "${date.year}-";
    if (date.month < 10) ans = ans + "0";
    ans = ans + "${date.month}-";
    if (date.day < 10) ans = ans + "0";
    ans = ans + "${date.day}";
    return ans;
  }
}
