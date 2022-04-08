import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:the_mechanic/screens/Eventview.dart';
import 'package:the_mechanic/screens/eventdata.dart';
import 'package:the_mechanic/screens/eventprovi.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Eventprovider>(context);
    final selectedEvents = provider.evventsOfSelectedDate;
    if (selectedEvents.isEmpty) {
      return Center(
          child: Text(
        'No Events found',
        style: TextStyle(color: Colors.black, fontSize: 24),
      ));
    }

    return SfCalendar(
      view: CalendarView.timelineDay,
      dataSource: EventDataSource(provider.events),
      initialDisplayDate: provider.selectedDate,
      appointmentBuilder: appointmentBuilder,
      onTap: (details) {
        if (details.appointments == null) return;
        final event = details.appointments!.first;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventViewingPage(event: event)));
      },
    );
  }

  Widget appointmentBuilder(
      BuildContext context, CalendarAppointmentDetails details) {
    final event = details.appointments.first;
    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text(
          event.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
