
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mechanic/screens/event.dart';
import 'package:the_mechanic/screens/util.dart';
import 'eventprovi.dart';

class Eventedit extends StatefulWidget {
  final Event? event;
  const Eventedit({Key? key, this.event}) : super(key: key);

  @override
  State<Eventedit> createState() => _EventeditState();
}

class _EventeditState extends State<Eventedit> {
  late DateTime fromDate;
  late DateTime toDate;
  final titleController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(195, 255, 193, 7),
        leading: CloseButton(),
        actions: buildedit(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(), hintText: "Add Text"),
                style: TextStyle(fontSize: 24),
                onFieldSubmitted: (_) {
                  saveForm();
                },
                validator: (title) => title != null && title.isEmpty
                    ? "Title Cannot be Empty"
                    : null,
                controller: titleController,
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                children: [
                  buildHeader(
                    header: 'FROM',
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: builddropdown(
                            text: Utils.toDate(fromDate),
                            onClicked: () {
                              pickFromDate(pickDate: true);
                            },
                          ),
                        ),
                        Expanded(
                          child: builddropdown(
                            text: Utils.toTime(fromDate),
                            onClicked: () {
                              pickFromDate(pickDate: false);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  buildHeader(
                    header: 'To',
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: builddropdown(
                            text: Utils.toDate(toDate),
                            onClicked: () {
                              pickToDate(pickDate: true);
                            },
                          ),
                        ),
                        Expanded(
                          child: builddropdown(
                            text: Utils.toTime(toDate),
                            onClicked: () {
                              pickToDate(pickDate: false);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future pickFromDate({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;
    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }
    setState(() {
      fromDate = date;
    });
  }

  Future pickToDate({required bool pickDate}) async {
    final date = await pickDateTime(toDate, pickDate: pickDate);
    if (date == null) return;
    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }
    setState(() {
      toDate = date;
    });
  }

  Future<DateTime?> pickDateTime(DateTime initialDate,
      {required bool pickDate, DateTime? firstDate}) async {
    if (pickDate) {
      final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime(2015),
          lastDate: DateTime(2101));
      if (date == null) return null;
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
          context: context, initialTime: TimeOfDay.fromDateTime(initialDate));
      if (timeOfDay == null) return null;
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }

  Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          child
        ],
      );
  Widget builddropdown({
    required String text,
    required onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: Icon(
          Icons.arrow_drop_down_circle_outlined,
          color: Colors.amber,
        ),
        onTap: onClicked,
      );
  List<Widget> buildedit() => [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shadowColor: Colors.transparent,
            ),
            onPressed: saveForm,
            icon: Icon(Icons.done),
            label: Text("save"))
      ];
  Future saveForm() async {
    final isValid = formkey.currentState!.validate();
    if (isValid) {
      final event = Event(
          title: titleController.text,
          from: fromDate,
          to: toDate,
          description: "Description");
      final provider = Provider.of<Eventprovider>(context, listen: true);
      provider.addEvent(event);
      Navigator.pop(context);
    }
  }
}
