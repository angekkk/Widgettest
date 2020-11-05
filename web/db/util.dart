import 'dart:async';
import 'package:sqljocky5/sqljocky.dart';

Future<void> readData(MySqlConnection conn) async {
  StreamedResults result =
  await conn.execute('SELECT * FROM dataset');
  await for (Row r in result) {
    print(r.byName('nome'));
  }
}

main() async {
  var s = ConnectionSettings(
    user: "root",
    password: "root",
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