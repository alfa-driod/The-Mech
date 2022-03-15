import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view:CalendarView.month ,
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
    );
  }
}