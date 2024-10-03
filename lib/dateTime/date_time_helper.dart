//convert DateTime object to string yyyy-MM-dd
String convertDateTimeToString(DateTime dateTime) {
  //year in the format yyyy
  String year = dateTime.year.toString();

  //month in the format MM
  String month = dateTime.month.toString().padLeft(2, '0');
  //day in the format dd
  String day = dateTime.day.toString().padLeft(2, '0');
  //final date in the format yyyy-MM-dd
  String date = '$year-$month-$day';
  return date;
}
