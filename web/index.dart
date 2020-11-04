//import 'dart:io' as io; NON SUPPORTATA PER WEB-APP
import 'dart:convert';
import 'dart:html';

// ...



Future<void> main() async {
  var req = new HttpRequest();
  req.open('post','http://localhost:53322/php/write_dataset.php');

  var textarea = querySelector('#textArea');
  var data = await HttpRequest.getString('php/Dataset.json');


  textarea.text = (json.decode(data).toString());

}