import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
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
                      onPressed: () {},
                      textColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
