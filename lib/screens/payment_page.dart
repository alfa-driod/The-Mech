import 'dart:io';
import 'dart:math';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:squircle/squircle.dart';
import 'package:the_mechanic/form_field.dart';
import 'package:flutterwave/flutterwave.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController phoneController = new TextEditingController();
  TextEditingController NameController = new TextEditingController();
  TextEditingController AmountController = new TextEditingController();
 

  String phoneNumber = "";
  String Name = "";
  String? _ref;
  void setRef() {
    Random rand = Random();
    int number = rand.nextInt(2000);
    if (Platform.isAndroid) {
      setState(() {
        _ref = "AndroidRef491$number";
      });
    } else {
      setState(() {
        _ref = "IOSREF$number";
      });
    }
  }

  void _onCountryChange(CountryCode countryCode) {
    phoneNumber = countryCode.toString();
    print("New Country selected: " + countryCode.toString());
  }

  @override
  void initState() {
    setRef();
    super.initState();
  }

  void check() {
    print("Full Text: " + phoneNumber + phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    final phone = new TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      autofocus: false,
      
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.call),
        hintText: "phone number",
      ),
      style: new TextStyle(
        fontSize: 14.0,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    );

    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: [
            SizedBox(
              height: 150,
            ),
            CountryCodePicker(
              onChanged: _onCountryChange,
              initialSelection: 'GH',
              favorite: ['+233', 'GH'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
              backgroundColor: Colors.black,
              barrierColor: Colors.black,
              dialogBackgroundColor: Colors.black,
            ),
            SizedBox(height: 16.0),
            phone,
            SizedBox(height: 50.0),
            TextFormField(
              controller: NameController,
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "Your Name", prefixIcon: Icon(Icons.person)),
              style: new TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 50.0),
            TextFormField(
              controller: AmountController,
              keyboardType: TextInputType.number,
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "How much are you payiing", prefixIcon: Icon(Icons.attach_money)),
              style: new TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 100),
            GestureDetector(
              onTap: () {
                final name = NameController.text;
                final number = phoneController.text;
                final amount = phoneController.text;
                if (name.isEmpty || number.isEmpty ||amount.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Fields are empty")));
                } else {
                  _makepayment(context,name.trim(),amount.trim(),number.trim());
                }
              },
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                color: Colors.amberAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.payment,
                      size: 30,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      'Make Payment',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void _makepayment(BuildContext context, String number, String name,String amount) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          context: this.context,
          encryptionKey: "FLWSECK_TESTe4d295224c42",
          publicKey: "FLWPUBK_TEST-a929cf86c136b41f041dea1800ffae2b-X",
          currency: "GHC",
          amount:amount ,
          email: "Princebig12345@gmail.com",
          fullName: name,
          txRef: _ref!,
          isDebugMode: true,
          phoneNumber: number,
          acceptCardPayment: true,
          acceptUSSDPayment: false,
          acceptAccountPayment: false,
          acceptFrancophoneMobileMoney: true,
          acceptGhanaPayment: true,
          acceptMpesaPayment: false,
          acceptRwandaMoneyPayment: true,
          acceptUgandaPayment: false,
          acceptZambiaPayment: false,
      
        
          );

      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();
      if (response.data == null) {
        print("Tansaction Failed");
      } else {
        print(response.message);
        print(response.status);
      }
    } catch (error) {
      print(error);
    }
  }
}
