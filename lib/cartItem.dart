import 'dart:math';

import 'product_details.dart';
import 'saleItem.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartItems extends StatefulWidget {
  final Products itemss;
  const CartItems({
    Key? key,
    required this.itemss,
  }) : super(key: key);

  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  bool isVisible = false;

  int number = 1;
  void addItemNumber() {
    number++;
    isVisible = true;
    setState(() {});
  }

  void removeItemNumber() {
    if (number > 1) {
      number--;
    }
    isVisible = !(number <= 1);

    setState(() {});
    print(isVisible);
  }

  @override
  Widget build(BuildContext context) {
    final Products itemss = widget.itemss;
    // final int num = widget.num;
    // final Function add = widget.add;
    // final Function minus = widget.minus;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: SizedBox(
            height: 152,
            width: MediaQuery.of(context).size.width * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetails(itemss: itemss)));
                      },
                      child: Container(
                        width: 110,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: AssetImage(itemss.img),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(itemss.name,
                            style: TextStyle( 
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                color: Colors.white)),
                        Text(itemss.color,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w100,
                                color: Colors.white)),
                        Text(itemss.size,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w100,
                                color: Colors.white)),
                        Text(r'$' "${itemss.price * number}",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w100,
                                color: Colors.white))
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Visibility(
                          visible: isVisible,
                          child: IconButton(
                              onPressed: () {
                                removeItemNumber();
                              },
                              icon: const Icon(
                                Iconsax.minus,
                                color: Colors.red,
                              )),
                        ),
                        Text('$number',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w100,
                                color: Colors.white)),
                        IconButton(
                            onPressed: () {
                              addItemNumber();
                            },
                            icon: const Icon(
                              Iconsax.add,
                              color: Colors.blue,
                            ))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
