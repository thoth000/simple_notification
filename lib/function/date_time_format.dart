import 'package:intl/intl.dart';

String dateTimeFormat(DateTime time){
  String timeString = DateFormat("y年M月d日 kk:mm").format(time);
  return timeString;
}