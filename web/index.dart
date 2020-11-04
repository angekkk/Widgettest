//import 'dart:io' as io; NON SUPPORTATA PER WEB-APP
import 'dart:convert';
//import 'dart:html';
import 'package:universal_io/io.dart' as io;
// ...



void main() {
 // var textarea = querySelector('.container').querySelector('.text');

  new io.File('php/pao_a.json')
      .readAsString()
      .then((fileContents) => json.decode(fileContents))
      .then((jsonData) {
       print( jsonData.toString());
  });
}