import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:the_mechanic/screens/event.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
  }
  Event getEvent(int index) => appointments![index] as Event;
  @override
 DateTime getStartTime(int index)=>getEvent(index).from;
  @override
 DateTime geEndTime(int index)=>getEvent(index).to;
  @override
 String getSubject(int index)=>getEvent(index).title;
  @override
 bool isAllDay(int index)=>getEvent(index).isisAlDay;
  
}
