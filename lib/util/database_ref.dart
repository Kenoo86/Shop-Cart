import 'package:sqflite/sqflite.dart';

Database? database_ref;

Future<void> openDb() async {
  database_ref = await openDatabase(
    'products.db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'create table products (id integer primary key, name text, imageurl text, describe text, price text)');
      print('database Created');
    },
  );

  // await deleteDatabase('tasks.db');
}
