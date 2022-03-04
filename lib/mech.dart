import 'package:the_mechanic/saleItem.dart';
import 'package:the_mechanic/screens/cart.dart';
import 'package:the_mechanic/screens/home_page.dart';
import 'package:flutter/material.dart';

class Mechanic extends StatelessWidget {
  const Mechanic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> prices = [];
    for (Products products in productItems) {
      prices.add(products.price);
    }
    final value = prices.reduce((value, element) => element + value);
    return DefaultTabController(
        
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            bottom: TabBar(
              labelColor: Colors.amberAccent,
              unselectedLabelColor: Colors.grey,
              
              tabs: [
              Tab(
                text: 'Auto-Parts',
              ),
              Tab(
                text: 'Cart',
              ),
            ]),
          ),
          body: TabBarView(children: [
            HomePage(),
            Cart(
              totalPrice: value,
            )
          ]),
        ));
  }
}
