import 'package:flutter/widgets.dart';

import 'event.dart';

class Eventprovider extends ChangeNotifier {
  final List<Event> _events = [];
  List<Event> get events => _events;
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  void setDate(DateTime date) => _selectedDate = date;
  List<Event> get evventsOfSelectedDate => _events;
  void addEvent(Event event) {
    events.add(event);
    notifyListeners();
  }
}
