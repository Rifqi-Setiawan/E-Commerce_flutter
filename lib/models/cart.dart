import 'package:e_commerce_flutter/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
      name: "Adidas",
      price: '236',
      imagePath: 'lib/images/sepatu1.jpeg',
      description: "Sepatu dengan sol yang empuk.",
    ),
    Shoe(
      name: "Compass",
      price: '72',
      imagePath: 'lib/images/sepatu2.jpeg',
      description: "Sepatu dengan sol yang empuk.",
    ),
    Shoe(
      name: "Ventela",
      price: '26',
      imagePath: 'lib/images/sepatu1.jpeg',
      description: "Sepatu dengan sol yang empuk.",
    ),
  ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
