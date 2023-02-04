import 'package:xplorevjtiofficialapp/constants/app_constants.dart';

dynamic timeDecode(String time) {
  final details = {};
  int firstDash = time.indexOf('-');
  int lastDash = time.lastIndexOf('-');
  int space = time.indexOf(" ");
  int firstColon = time.indexOf(":");
  int lastColon = time.lastIndexOf(":");

  details['year'] = time.substring(firstDash - 2, firstDash);
  details['month'] = month[time.substring(firstDash + 1, lastDash)];
  details['date'] = time.substring(lastDash + 1, space);
  details['hour'] = time.substring(space + 1, firstColon);
  details['min'] = time.substring(firstColon + 1, lastColon);
  details['sec'] = time.substring(lastColon + 1, lastColon + 3);

  return details;
}
