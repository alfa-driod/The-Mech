import 'package:flutter/widgets.dart';


import 'event.dart';

class Eventprovider extends ChangeNotifier {
  final List<Event> _events = [];
  List<Event> get events => _events;
  void addEvent(Event event) {
    events.add(event);
    notifyListeners();
  }
}
