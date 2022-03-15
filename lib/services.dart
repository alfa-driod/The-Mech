import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  Services({Key? key, required this.serves, required this.position})
      : super(key: key);

  final Library serves;
  final int position;

  final ValueNotifier<bool> _isAddedNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    Library serve = serves;

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: Colors.white, width: 2)),
      color: Colors.black,
      child: SizedBox(
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: ListTile(
          title: Text(
            serve.name,
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
          subtitle: Text(
            '${serve.startTime} - ${serve.endTime}',
            style: const TextStyle(color: Colors.white),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                serve.startingPrice,
                style: const TextStyle(color: Colors.white),
              ),
              ValueListenableBuilder<bool>(
                  valueListenable: _isAddedNotifier,
                  builder: (context, isAdded, child) {
                    return IconButton(
                      onPressed: () {
                        _isAddedNotifier.value = !_isAddedNotifier.value;
                      },
                      icon: Icon(
                        !isAdded ? Icons.add_circle : Icons.check_circle,
                        color: !isAdded ? Colors.white : Colors.green,
                        size: 30,
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class Library {
  final String name;
  final String startingPrice;
  final String startTime;
  final String endTime;

  Library(this.name, this.startTime, this.endTime, this.startingPrice);
}

List<Library> mech = [
  Library('Engine', '45 mins', '3 hours', '450'),
  Library('Wheel Alignment', '55 mins', '2 hours', '220'),
  Library('Parts Replacement', '6 hours', '3 days', '180'),
  Library('Brake Fixtures', '1.5 hours', '8 hours', '200'),
  Library('Flat Tyres', '5 mins', '20 mins', '5'),
];
