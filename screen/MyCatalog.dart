import 'package:flutter/material.dart';
import '../model/Item.dart';
import "package:provider/provider.dart";
import '../provider/shoppingcart_provider.dart';

class MyCatalog extends StatefulWidget {
  const MyCatalog({super.key});

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  // list of product items
  List<Item> productsCatalog = [
    Item("Shampoo", 10.00, 2),
    Item("Soap", 12, 3),
    Item("Toothpaste", 40, 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("My Catalog")),
        // outputs each product item using ListView Builder
        body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.star),
                title: Text(
                    "${productsCatalog[index].name} - ${productsCatalog[index].price}"),
                // button:
                trailing: TextButton(
                  child: const Text("Add"),
                    onPressed: () {
                      context
                          // adds item to the shopping cart
                          .read<ShoppingCart>()
                          .addItem(productsCatalog[index]);
                      // notifies the user that an item is added 
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${productsCatalog[index].name} added!"),
                        duration: const Duration(seconds: 1, milliseconds: 100),
                      ));
                    },
                ),
              );
            },
            itemCount: productsCatalog.length),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () {
            // goes to /cart route when floating action button is clicked
            Navigator.pushNamed(context, "/cart");
          },
        ));
  }
}
