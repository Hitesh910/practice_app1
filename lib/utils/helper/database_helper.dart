import 'package:sqflite/sqflite.dart';

import '../../screen/home/model/databse_model.dart';

class DatabaseHelper {
  static DatabaseHelper helper = DatabaseHelper._();

  DatabaseHelper._();

  Database? database;

  Future<Database?> checkDb() async {
    if (database == null) {
      database = await createDb();
      print("================= database checkDb ${database}");
    }
    return database!;
  }

  Future<Database> createDb() async {
    String folder = await getDatabasesPath();
    String path = "$folder/demo.db";
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE product (cid INTEGER  PRIMARY KEY AUTOINCREMENT,title TEXT,price INTEGER)";

        db.execute(query);
        // database!.execute(query);
      },
    );
  }

  Future<void> insertDb(DatabaseModel model) async {
    database = await checkDb();
    database!.insert('product', {'title': model.title,'price': model.price});
    print("============ database ${model.title}");
    // database!.execute(query);
  }

  void getDb() {}

  Future<List<DatabaseModel>> readDb() async {
    database = await checkDb();
    String query = "SELECT * FROM product";
    List<Map> l1 = await database!.rawQuery(query);
    List<DatabaseModel> dbData = l1
        .map(
          (e) => DatabaseModel.mapToModel(e),
        )
        .toList();
    print("============= database read ${dbData.length}");
    print("============= database read ${dbData[0]}");
    return dbData;
  }
}
