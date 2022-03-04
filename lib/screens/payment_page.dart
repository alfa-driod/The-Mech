import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:squircle/squircle.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  child: Icon(
                    Iconsax.arrow_left_2,
                    color: Colors.black,
                  ),
                ),
              )),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 6),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              child: Text('Payment Method',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  )),
            ),
            ListTile(
              leading: Card(
                shape: SquircleBorder(superRadius: 10),
                color: Colors.green.shade300,
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(SimpleIcons.mastercard),
                ),
              ),
              title: Text('MasterCard',style: TextStyle(color: Colors.white),),
              subtitle: Text('**** **** 4199',style: TextStyle(color: Colors.white)),
              trailing: IconButton(
                color: Colors.white,
                icon: Icon(
                  Icons.radio_button_checked,
                ),
                onPressed: () {},
              ),
            ),
            ListTile(
              leading: Card(
                shape: SquircleBorder(superRadius: 10),
                color: Colors.lightBlue.shade300,
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(SimpleIcons.visa),
                ),
              ),
              title: Text('Visa Card',style: TextStyle(color: Colors.white)),
              subtitle: Text('**** **** 4199',style: TextStyle(color: Colors.white)),
              trailing: IconButton(
                color: Colors.white,
                icon: Icon(
                  Icons.radio_button_checked,
                ),
                onPressed: () {},
              ),
            ),
           
            ListTile(
              leading: Card(
                shape: SquircleBorder(superRadius: 10),
                color: Colors.grey.shade300,
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(
                    BootstrapIcons.apple,
                  ),
                ),
              ),
              title: Text('Apple Pay',style: TextStyle(color: Colors.white)),
              subtitle: Text('**** **** 4199',style: TextStyle(color: Colors.white)),
              trailing: IconButton(
                color: Colors.white,
                icon: Icon(
                  Icons.radio_button_checked,
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 22,
            //   ),
            //   child: Text('Payment Method',
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 30,
            //       )),
            // ),
            // ListTile(
            //   leading: Card(
            //     shape: SquircleBorder(superRadius: 10),
            //     color: Colors.grey.shade300,
            //     child: SizedBox(
            //       height: 50,
            //       width: 50,
            //       child: Icon(Iconsax.location),
            //     ),
            //   ),
            //   title: Text('Laterbiokorshie'),
            //   subtitle: Text('Accra - Ghana'),
            //   trailing: IconButton(
            //     icon: Icon(Iconsax.arrow_right_25),
            //     onPressed: () {},
            //   ),
            // ),
            // ListTile(
            //   leading: Card(
            //     shape: SquircleBorder(superRadius: 10),
            //     color: Colors.grey.shade300,
            //     child: SizedBox(
            //       height: 50,
            //       width: 50,
            //       child: Icon(Iconsax.clock),
            //     ),
            //   ),
            //   title: Text('Delivery between 21st and 30th January 2022'),
            //   subtitle: Text('Premium Express Delivery'),
            //   trailing: IconButton(
            //     icon: Icon(Iconsax.arrow_right_25),
            //     onPressed: () {},
            //   ),
            // ),

            // ListTile(
            //   leading: Card(
            //     shape: SquircleBorder(superRadius: 10),
            //     color: Colors.red,
            //     child: SizedBox(
            //       height: 50,
            //       width: 50,
            //     ),
            //   ),
            //   title: Text('MTN Mobile Money'),
            //   subtitle: Text('**** **** 4199'),
            //   trailing: IconButton(
            //     icon: Icon(Icons.radio_button_checked),
            //     onPressed: () {},
            //   ),
            // ),
            // ListTile(
            //   leading: Card(
            //     shape: SquircleBorder(superRadius: 10),
            //     color: Colors.red,
            //     child: SizedBox(
            //       height: 50,
            //       width: 50,
            //     ),
            //   ),
            //   title: Text('Apple Pay'),
            //   subtitle: Text('**** **** 4199'),
            //   trailing: IconButton(
            //     icon: Icon(Icons.radio_button_checked),
            //     onPressed: () {},
            //   ),
            // ),
          ],
        ));
  }
}
