import 'package:flutter/material.dart';
import '../Model/product.dart';
import '../Widgets/cart_item_card.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double getTotalPrice() {
    double total = 0;
    for (Product product in widget.cartItems) {
      total += product.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: widget.cartItems.isEmpty
          ? Center(
        child: Text('Your cart is empty.'),
      )
          : ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          Product product = widget.cartItems[index];
          return CartItemCard(
            product: product,
          );
        },
      ),
      floatingActionButton: widget.cartItems.isEmpty
          ? null
          : Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              'Total:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            trailing: Text(
              '₱${getTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              // Perform checkout
              // You can implement your own logic here
            },
            label: Text('Checkout'),
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
