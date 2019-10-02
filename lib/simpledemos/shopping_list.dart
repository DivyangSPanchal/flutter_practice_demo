import 'package:flutter/material.dart';
import 'package:flutter_practice_demo/simpledemos/shopping_cart.dart';

class Demo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shopping List"),
        ),
        body: ShoppingList(
          products: <Product>[
            Product(name: "Egg"),
            Product(name: "Flour"),
            Product(name: "Choco Chips")
          ],
        ),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  ShoppingList({Key key, this.products}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ShoppingListState();
  }
}

class ShoppingListState extends State<ShoppingList> {
  Set<Product> shoppingCart = Set<Product>();

  void handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        shoppingCart.add(product);
      } else {
        shoppingCart.remove(product);
      }
    });
  }

  @override
  void didUpdateWidget(ShoppingList oldWidget) {
    print("${oldWidget.products.length} : ${widget.products.length} ");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: widget.products.map((Product product) {
        return ShoppingListItem(
          product: product,
          inCart: shoppingCart.contains(product),
          onCartChanged: handleCartChanged,
        );
      }).toList(),
    );
  }
}
