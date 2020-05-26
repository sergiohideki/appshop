import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_item_widget.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final cartItems = cart.items.values.toList();

    return Scaffold(
        appBar: AppBar(
          title: Text('Carrinho'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(25),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Text(
                        'R\$${cart.totalAmount}',
                        style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6
                              .color,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    Spacer(),
                    FlatButton(
                      child: Text('COMPRAR'),
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false)
                            .addOrder(cart);
                        cart.clear();
                      },
                      textColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cart.itemsCount,
                itemBuilder: (ctx, index) => CartItemWidget(cartItems[index]),
              ),
            )
          ],
        ));
  }
}
