class Product {
  final String productId;
  final String name;
  final String description;
  final double price;
  final String imageURL;

  Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageURL,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['_id'].toString(),
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'].toDouble(),
      imageURL: json['imageURL'] as String,
    );
  }



  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'name': name,
      'description': description,
      'price': price,
      'imageURL': imageURL,
    };
  }
}
