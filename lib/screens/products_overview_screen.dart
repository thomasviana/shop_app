import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/products_grid.dart';
import 'package:shop_app/widgets/badge.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/providers/cart.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductosOverviewScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _ProductosOverviewScreenState createState() =>
      _ProductosOverviewScreenState();
}

class _ProductosOverviewScreenState extends State<ProductosOverviewScreen> {
  var showFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  showFavorites = true;
                } else {
                  showFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(showFavorites),
      // body: Center(
      //   child: Text('data'),
    );
  }
}
