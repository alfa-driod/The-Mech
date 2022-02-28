import 'package:the_mechanic/product_details.dart';
import 'package:the_mechanic/saleItem.dart';
import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';

class ProductBuilder extends StatelessWidget {
  final Products itemss;
  final Function ontap;
  const ProductBuilder({Key? key, required this.itemss, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        height: 280,
        width: 160,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
                height: 250,
                width: 150,
                decoration: ShapeDecoration(
                    shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(
                            cornerRadius: 30, cornerSmoothing: 1)),
                    image: DecorationImage(
                        image: AssetImage(itemss.img), fit: BoxFit.cover))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: SizedBox(
                width: 135,
                height: 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemss.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.white),
                    ),
                    Text(r"$" + '${itemss.price}',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.white))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
