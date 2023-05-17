import 'package:flutter/material.dart';
import '../Database/mongodb_provider.dart';
import '../Model/product.dart';
import '../Widgets/product_card.dart';
import 'cart_screen.dart';
import 'products_details_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Product> cartItems = [];
  bool isFetching = false;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    setState(() {
      isFetching = true;
    });

    MongoDBProvider mongoDBProvider = MongoDBProvider();
    cartItems = await mongoDBProvider.getProducts(); // Assign the fetched products to cartItems

    setState(() {
      isFetching = false;
    });
  }

  Future<void> _handleRefresh() async {
    await fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bakery Shop',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: isFetching
              ? const Center(
                 child: CircularProgressIndicator(),
          )
              : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                Product product = cartItems[index];

               return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                        name: product.name,
                        description: product.description,
                        price: product.price,
                        imageURL: product.imageURL,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ProductCard(
                    product: product,
                    onAddToCart: () {},
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(cartItems: cartItems),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
