import 'package:mongo_dart/mongo_dart.dart';

void connectToMongoDB() async {
  final db = Db('mongodb+srv://test123:123456!@cluster0.34gh2cq.mongodb.net/node-products');
  await db.open();
  // Perform database operations
  // ...
  await db.close();
}
