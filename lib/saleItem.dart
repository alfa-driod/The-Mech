class Products {
  final String img;
  final String name;
  final String color;
  final int price;
  final String size;

  double get subTotal => productItems.fold(
      0, (totalPrice, currentPrice) => totalPrice + currentPrice.price);

  String get subTotalString => subTotal.toStringAsFixed(2);

  Products(this.img, this.name, this.price, this.size, this.color);
}

List<Products> productItems = [
  Products('media/img/bonnet.jpg', 'Bonnet', 150, 'XL', 'Black'),
  Products('media/img/breaks.png', 'Breaks', 240, 'L', 'Green'),
  Products('media/img/headlights.jpg', 'Head Lights', 180, 'L', 'Black'),
  Products('media/img/engine.jpg', 'Engine', 90, 'XL', 'Blue'),
  Products('media/img/tire.jpg', 'Tire', 95, 'XXL', 'Black'),
  Products('media/img/seat.jpg', 'Seats', 40, '45', 'Red')
];
