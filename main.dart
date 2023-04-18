import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/MyCart.dart';
import 'package:flutter_application_1/screen/MyCatalog.dart';
import 'package:provider/provider.dart';
import 'provider/shoppingcart_provider.dart';
// import "package:state_management/screen/Checkout.dart";

void main() {
  runApp(MultiProvider(providers: [
    // tracks shopping cart's contents
    ChangeNotifierProvider(create: (context) => ShoppingCart()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/cart": (context) => const MyCart(),
        "/products": (context) => const MyCatalog(),
      },
      home: const MyCatalog(),
    );
  }
}
