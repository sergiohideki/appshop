import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';
import '../widgets/app_drawer.dart';
import '../providers/cart.dart';
import '../utils/app_routes.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductOverViewScreen extends StatefulWidget {
  @override
  _ProductOverViewScreenState createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  bool _showFavoriteOnly = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    //carregar os produtos
    Provider.of<Products>(context, listen: false).loadProducts().then(
          (_) => setState(() {
            _isLoading = false;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Minha Loja'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorite) {
                    _showFavoriteOnly = true;
                  } else {
                    _showFavoriteOnly = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Somente Favoritos'),
                  value: FilterOptions.Favorite,
                ),
                PopupMenuItem(
                  child: Text('Todos'),
                  value: FilterOptions.All,
                ),
              ],
            ),
            Consumer<Cart>(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART);
                },
              ),
              builder: (_, cart, child) => Badge(
                value: cart.itemsCount.toString(),
                child: child,
              ),
            )
          ],
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ProductGrid(_showFavoriteOnly),
        drawer: AppDrawer());
  }
}
