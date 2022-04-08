import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:the_mechanic/main.dart';
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
  final descriptionController = TextEditingController();
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
        backgroundColor: Colors.transparent,
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
                maxLength: 10,
            maxLengthEnforcement:MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(), hintText: "What do you want to fix"),
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
              ),
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: TextFormField(
               maxLength: 30,
            maxLengthEnforcement:MaxLengthEnforcement.enforced,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                    decoration:InputDecoration(
                      
                      hintText:"Describe The fault on you car",
                       contentPadding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      fillColor:Colors.black,
                      filled: true
                    ),
                     validator: (descriptioon) => descriptioon != null && descriptioon.isEmpty
                      ? "Title Cannot be Empty"
                      : null,
                  controller: descriptionController,
                  ),
           ),
         
            
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
              primary: Colors.amber,
              shadowColor: Colors.transparent,
            ),
            onPressed: saveForm,
            icon: Icon(Icons.done,color: Colors.black,),
            label: Text("save",style: TextStyle(color: Colors.black),))
      ];
  Future saveForm() async {
    final isValid = formkey.currentState!.validate();
    if (isValid) {
      final event = Event(
          title: titleController.text,
          from: fromDate,
          to: toDate,
          description: "Description");
      addservices();
      final provider = Provider.of<Eventprovider>(context, listen: false);
      provider.addEvent(event);
      Navigator.pop(context);
    }
  }

  Future<Map> addservices() async {
    User? user = FirebaseAuth.instance.currentUser;
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child('users').child(user!.uid);
    final add = await userRef.child('Appointments').set({
      'title': titleController.text.trim(),
      'start time': fromDate.toString(),
      'end time': fromDate.toString(),
      'Description': descriptionController.text.trim(),
    });
    print(add as Map);
    return add as Map;
  }
}
