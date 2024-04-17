import 'package:mongo_dart/mongo_dart.dart';

class DataSource {
  static final db = Db("mongodb://localhost:27017/mongo_dart-blog");
  static Future<void> init() async {
    await db.open();
  }
}
