import 'package:sqflite/sqflite.dart';
import "package:test/test.dart";

_create() async {
  String path = "a.db";
  // open the database
  Database db = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
  });

  // Insert some records in a transaction
  await db.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
    print('inserted1: $id1');
    int id2 = await txn.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
        ['another name', 12345678, 3.1416]);
    print('inserted2: $id2');
  });

  // Update some record
  int count = await db.rawUpdate(
      'UPDATE Test SET name = ?, value = ? WHERE name = ?',
      ['updated name', '9876', 'some name']);
  print('updated: $count');

// Get the records
  List<Map> list = await db.rawQuery('SELECT * FROM Test');
  List<Map> expectedList = [
    {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
    {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
  ];
  print("//------------------------------------------------");
  print(list);
  print("//------------------------------------------------");

  print(expectedList);
  //assert(const DeepCollectionEquality().equals(list, expectedList));

// Count the records
  count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM Test'));
  assert(count == 2);

// Delete a record
  count = await db
      .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
  assert(count == 1);

// Close the database
  await db.close();
}

void main() {
  test("String.split() splits the string on the delimiter", () {
    var string = "foo,bar,baz";
    expect(string.split(","), equals(["foo", "bar", "baz"]));
  });
  //
}
