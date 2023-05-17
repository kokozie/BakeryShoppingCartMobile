import 'package:mongo_dart/mongo_dart.dart';

import '../Model/product.dart';

class MongoDBProvider {
  static const String databaseName = 'node-products';
  static const String collectionName = 'products';
  static const String connectionString = 'mongodb+srv://test123:123456!@cluster0.34gh2cq.mongodb.net/node-products';

  Future<List<Product>> getProducts() async {
    final db = await Db.create(connectionString);
    await db.open();

    final products = await db.collection(collectionName).find().toList();

    final productList = products.map((json) => Product.fromJson(json)).toList();

    await db.close();

    return productList;
  }

  Future<void> saveProduct(Product product) async {
    final db = await Db.create(connectionString);
    await db.open();

    await db.collection(collectionName).save(product.toJson());

    await db.close();
  }
}
