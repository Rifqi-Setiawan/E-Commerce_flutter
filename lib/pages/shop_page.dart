import 'package:e_commerce_flutter/components/shoe_tile.dart';
import 'package:e_commerce_flutter/models/cart.dart';
import 'package:e_commerce_flutter/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    showDialog(context: context, 
    builder: (context) => AlertDialog(
      title: Text("Barang berhasil ditambahkan!"),
      content: Text("Check keranjang anda"),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          // Massages
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              "Temukan gaya anda, bebaskan langkah anda!",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "TRENDING🔥",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  "Lihat Semua",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Shoe shoe = value.getShoeList()[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addShoeToCart(shoe),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 25,
              left: 25,
              right: 25,
            ),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
