// THIS DOESN'T WORK IN A BROWSER ENVIRONMENT (aka client side)
import 'dart:io' as io;
import 'dart:convert';
import 'dart:html';

// ...



void main() {
  new io.File('php/pao_a.json')
      .readAsString()
      .then((fileContents) => json.decode(fileContents))
      .then((jsonData) {
       print('JSON :  '+jsonData.toString());
       querySelector('#textArea').text = jsonData.toString();

  });
}