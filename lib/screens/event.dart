class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final bool isisAlDay;
  const Event({
required this.title,
required this.description,
required this.from,
required this.to,
this.isisAlDay=false,
});
}

