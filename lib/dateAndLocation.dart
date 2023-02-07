
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
class DateAndLocation {

  String getDayOfWeekInArabic(int day) {
    switch (day) {
      case 1:
        return "الإثنين";
      case 2:
        return "الثلاثاء";
      case 3:
        return "الأربعاء";
      case 4:
        return "الخميس";
      case 5:
        return "الجمعة";
      case 6:
        return "السبت";
      case 7:
        return "الأحد";
      default:
        return "Invalid day";
    }
  }

  String getCurrentDateInArabic() {
    var now = DateTime.now();
    var formatter = new DateFormat.yMMMMd("ar");
    String formatted = formatter.format(now);
    String dayOfWeek = getDayOfWeekInArabic(now.weekday);
    return "$dayOfWeek, $formatted";
  }

  Future<Position> getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;}




}
