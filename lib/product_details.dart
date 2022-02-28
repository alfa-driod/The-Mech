import 'package:the_mechanic/saleItem.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetails extends StatefulWidget {
  final Products itemss;
  const ProductDetails({
    Key? key,
    required this.itemss,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final Products itemss = widget.itemss;
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        elevation: 0,
        child: Container(
          height: 65,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.black,
            // borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(r'$' '${itemss.price}',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: Colors.white)),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.purple.shade400),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 22),
                      child: Text(
                        'ADD TO CART',
                        style: TextStyle(
                            // color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.7),
                child: Icon(
                  Iconsax.arrow_left_2,
                  color: Colors.black,
                ),
              ),
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(itemss.img), fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itemss.name,
                    style: TextStyle(fontSize: 22),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Iconsax.star))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Text('Colors: ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  if (itemss.color == "Black") ...{
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.circle),
                      iconSize: 40,
                      color: Colors.black,
                    ),
                  } else ...{
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.circle),
                      color: Colors.black,
                    ),
                  },
                  if (itemss.color == "Red") ...{
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.circle),
                      iconSize: 40,
                      color: Colors.red,
                    ),
                  } else ...{
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.circle),
                      color: Colors.red,
                    ),
                  },
                  if (itemss.color == "Blue") ...{
                    IconButton(
                      onPressed: () {},
                      iconSize: 40,
                      icon: Icon(Icons.circle),
                      color: Colors.blue,
                    )
                  } else ...{
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.circle),
                      color: Colors.blue,
                    )
                  },
                  if (itemss.color == "Green") ...{
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.circle),
                      iconSize: 40,
                      color: Colors.green,
                    )
                  } else ...{
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.circle),
                        color: Colors.green)
                  },
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Available Sizes: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      Text(itemss.size,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: Colors.white))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Description:'),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Rexxie's Store",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('img/rexxie_profile.jpg'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('4.8'),
                      Icon(
                        Iconsax.star1,
                        color: Colors.yellow,
                        size: 18,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
