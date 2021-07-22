import 'dart:core';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quiantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quiantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          quiantity: existingItem.quiantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quiantity: 1,
        ),
      );
    }
  }
}
