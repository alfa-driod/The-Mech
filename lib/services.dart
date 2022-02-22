import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  final Library serves;

  const Services({Key? key, required this.serves}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    bool isAdded = true;
    Library serve = widget.serves;

    return Column(
      children: [
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.white, width: 2)),
          color: Colors.black,
          child: SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              title: Text(
                '${serve.name}',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              subtitle: Text(
                '${serve.startTime} - ${serve.endTime}',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${serve.startingPrice}',
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isAdded = !isAdded;
                      });
                    },
                    icon: Icon(
                      isAdded ? Icons.add_circle : Icons.check_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
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
