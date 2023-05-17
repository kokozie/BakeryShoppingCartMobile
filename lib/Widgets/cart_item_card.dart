import 'package:flutter/material.dart';
import '../Model/product.dart';

class CartItemCard extends StatelessWidget {
  final Product product;

  CartItemCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Image.network(
          product.imageURL,
          fit: BoxFit.cover,
          height: 60,
          width: 60,
        ),
        title: Text(
          product.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          product.description,
          style: TextStyle(fontSize: 14),
        ),
        trailing: Text(
          '₱${product.price.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
