import 'dart:js_util';

import 'package:coffe_shop_application/models/coffe.dart';
import 'package:coffe_shop_application/models/coffee_shop.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../components/coffee_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});
  
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    // Implement the addToCart function here-----
    Provider.of<CoffeShop>(context, listen: false).addItemToCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading message
              const Text(
                'How would you like your coffee?',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),

              //list of coffee to buy
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    // check if index is within bounds
                    if (index >= value.coffeeShop.length) {
                      return null;
                    }
                    // get individual coffee
                    Coffee eachCoffee = value.coffeeShop[index];

                    // return the tile for the coffee
                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => addToCart(eachCoffee),
                      icon: Icon(Icons.add),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
