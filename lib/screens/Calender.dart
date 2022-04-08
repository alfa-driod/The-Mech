import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mechanic/screens/Taskwidget.dart';
import 'package:the_mechanic/screens/eventdata.dart';
import 'eventprovi.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<Eventprovider>(context).events;

    return SfCalendar(
      view: CalendarView.month,
      dataSource: EventDataSource(events),
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      onTap: (details) {
        final provider = Provider.of<Eventprovider>(context, listen: false);
        provider.setDate(details.date!);
        showModalBottomSheet(
            context: context, builder: (context) => TasksWidget());
      },
    );
  }
}
