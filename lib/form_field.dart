import 'package:flutter/material.dart';

class Formfield extends StatefulWidget {
  

  Formfield({
    Key? key,
   
  }) : super(key: key);

  @override
  State<Formfield> createState() => _FormfieldState();
}

class _FormfieldState extends State<Formfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.search),
          hintText: 'Search For Autoshops',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }
}
