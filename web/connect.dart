import 'dart:async';
import 'package:sqljocky5/sqljocky.dart';
import 'dart:html';



/// Drops the tables if they already exist
Future<void> dropTables(MySqlConnection conn) async {
  print("Dropping tables ...");
  await conn.execute("DROP TABLE IF EXISTS pets, people");
  print("Dropped tables!");
}


Future<void> insertRows(MySqlConnection conn) async {

}

Future<void> readData(MySqlConnection conn) async {
  Results result = await (await conn
      .execute('SELECT * '
      'FROM dataset '))
      .deStream();
  print(result);
  print(result.map((r) => r.byName('nome')));
  querySelector(".container div:textarea").text =  result.toString();
}

main() async {
  var s = ConnectionSettings(
    user: "root",
    password: "mysql",
    host: "localhost",
    port: 3306,
    db: "pao",
  );

  // create a connection
  print("Opening connection ...");
  var conn = await MySqlConnection.connect(s);
  print("Opened connection!");


  await readData(conn);

  await conn.close();
}
















