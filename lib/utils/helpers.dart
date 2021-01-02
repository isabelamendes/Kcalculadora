bool isNumeric(String str) {
  try{
    var value = double.parse(str);
  } on FormatException {
    return false;
  } finally {
    return true;
  }
}

bool dateIsToday(DateTime data) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  final dateToCheck = data;
  final aDate = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
  if(aDate == today) {
    return true;
  }
  return false;
}

bool isSameDay(DateTime data1, DateTime data2) {
  final now = data1;
  final today = DateTime(now.year, now.month, now.day);

  final dateToCheck = data2;
  final aDate = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
  if(aDate == today) {
    return true;
  }
  return false;
}

