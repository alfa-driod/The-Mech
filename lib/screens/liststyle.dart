import 'dart:ui';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class Mylistile extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final int value;
  bool opened = true;
  String state ;

  Mylistile({
    Key? key,
    required this.image,
    required this.name,
    required this.location,
    required this.value,
    required this.opened,
 
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:10.0),
      child: Card(
        color: Color.fromARGB(249, 2, 29, 37),
        child: Row(
          
          children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              color: Colors.amberAccent,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  name,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                location,
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < value ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                      size: 15,
                    );
                  }),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:100.0,top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  state,style: TextStyle(color: opened?Colors.green:Colors.red),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
