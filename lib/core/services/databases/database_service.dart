import 'package:beautify/core/models/order/order_item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  // Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = join(databasePath, 'cart_database.db');

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<void> _onCreate(Database db, int version) async {
    // / Run the CREATE  TABLE statement on the database.
    await db.execute(
      'CREATE TABLE cartItems(product INTEGER PRIMARY KEY,name TEXT,image TEXT,price REAL,quantity INTEGER)',
    );
  }

  Future<void> insertOrderItem(OrderItem orderItem) async {
    final db = await _databaseService.database;

    db.insert(
      'cartItems',
      orderItem.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<OrderItem>> getOderItems() async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Query the table for all the Breeds.
    final List<Map<String, dynamic>> maps =
        await db.query('cartItems', orderBy: "product DESC");

    // Convert the List<Map<String, dynamic> into a List<OrderItem>.
    return List.generate(maps.length, (i) {
      return OrderItem(
          product: maps[i]['product'],
          name: maps[i]['name'],
          quantity: maps[i]['quantity'],
          price: maps[i]['price'],
          image: maps[i]['image']);
    });
  }

  Future<void> updateQuantity(OrderItem orderItem) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Update the given breed
    await db.update(
      'cartItems',
      orderItem.toMap(),
      // Ensure that the Breed has a matching id.
      where: 'product = ?',
      // Pass the Breed's id as a whereArg to prevent SQL injection.
      whereArgs: [orderItem.product],
    );
  }

  Future<void> deleteOrderItem(int product) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Remove the Breed from the database.
    await db.delete(
      'cartItems',
      // Use a `where` clause to delete a specific breed.
      where: 'product = ?',
      // Pass the Breed's id as a whereArg to prevent SQL injection.
      whereArgs: [product],
    );
  }

  Future<void> clearDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cart_database.db');
    await deleteDatabase(path);
  }
}
