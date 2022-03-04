import 'package:figma_squircle/figma_squircle.dart';
import 'package:the_mechanic/cartItem.dart';
import 'package:the_mechanic/saleItem.dart';
import 'payment_page.dart';
import 'package:squircle/squircle.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:squircle/squircle.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key, required this.totalPrice}) : super(key: key);
  final int totalPrice;

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 130,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Subtotal: '), Text('\$150')],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Delivery: '), Text('\$10')],
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Total: '), Text('${widget.totalPrice}')],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentPage()));
                },
                child: Card(
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                        cornerRadius: 12, cornerSmoothing: 1.5),
                  ),
                  color: Colors.blue.shade300,
                  child: SizedBox(
                      height: 35,
                      width: 250,
                      child: Center(
                          child: Text(
                        'Checkout',
                        style: TextStyle(color: Colors.white),
                      ))),
                ),
              )
            ],
          ),
        ),
      ),
      // appBar: AppBar(
      //   elevation: 0,
      //   leading: Icon(Iconsax.add3),
      //   title: Text(
      //     'Cart',
      //     style: TextStyle(fontWeight: FontWeight.w900),
      //   ),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          
          Expanded(
            child: ListView.builder(
              itemCount: productItems.length,
              itemBuilder: (context, index) {
                return CartItems(
                  itemss: productItems[index],
                  // num: number,
                  // add: addItemNumber,
                  // minus: removeItemNumber,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
