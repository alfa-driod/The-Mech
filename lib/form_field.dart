import 'package:flutter/material.dart';

class Formfield extends StatefulWidget {
  final String hint;

  Formfield({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  State<Formfield> createState() => _FormfieldState();
}

class _FormfieldState extends State<Formfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22)),
              color: Colors.white),
          width: MediaQuery.of(context).size.width * 0.8,
          height: 40,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field is required';
                }
              },
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: '${widget.hint}'),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
