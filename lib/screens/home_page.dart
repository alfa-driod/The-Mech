import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:the_mechanic/productBuilder.dart';
import 'package:the_mechanic/product_details.dart';
import 'package:the_mechanic/saleItem.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:squircle/squircle.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        key: scaffoldKey,
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                  child: Center(
                child: Text('Categories',
                    style:
                        TextStyle(fontSize: 45, fontWeight: FontWeight.w700)),
              )),
              Text('Men'),
              Text('Women'),
              Text('Extras'),
            ],
          ),
        ),
        // endDrawer: Drawer(child: DrawerHeader(child: Text('Settings'))),
        // appBar: AppBar(
        //   leading: Padding(
        //       padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        //       child: IconButton(
        //         onPressed: () {
        //           scaffoldKey.currentState?.openDrawer();
        //         },
        //         icon: Icon(
        //           Iconsax.category5,
        //           size: 16,
        //         ),
        //       )),
        //   actions: [
        //     IconButton(onPressed: () {}, icon: Icon(CarbonIcons.search)),
        //     IconButton(
        //         onPressed: () {}, icon: Icon(CarbonIcons.settings_adjust))
        //   ],
        //   elevation: 0,
        // ),
        body: GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          itemCount: productItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.5),
          itemBuilder: (context, index) {
            return ProductBuilder(
                itemss: productItems[index],
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetails(itemss: productItems[index])));
                });
          },
        ));
  }
}
