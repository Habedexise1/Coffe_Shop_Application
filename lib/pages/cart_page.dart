import 'package:coffe_shop_application/models/coffe.dart';
import 'package:coffe_shop_application/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop_application/components/coffee_tile.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //header
              Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),

              //List of cart items
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    // get individual cart items
                    Coffee eachCoffee = value.userCart[index];

                    // create a new function that calls removeFromCart with the appropriate parameter
                    void Function() onPressed =
                        () => removeFromCart(eachCoffee);

                    //return coffee tile
                    return CoffeeTile(
                        coffee: eachCoffee,
                        onPressed: onPressed,
                        icon: const Icon(Icons.delete));
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
