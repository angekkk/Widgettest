
import 'dart:convert';
import 'dart:html';

// ...

var el = querySelector('#modal-body');

class Dataset {
  Dataset({this.id, this.nome, this.descrizione, this.versione, this.nodi, this.thumb});


  String id;
  String nome;
  String descrizione;
  String versione;
  String nodi;
  String thumb;

  Dataset.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        descrizione = json['descrizione'],
        versione = json['versione'],
        nodi = json['nodi'],
        thumb = json['thumb'];
}



Future<void> main() async {

  var data = await HttpRequest.getString('php/Dataset.json');
  Map myMap = json.decode(data);
  List i = myMap['Dataset'];
  for ( var dat in i ) {
    createCard(dat['nome'],dat['descrizione'],dat['thumb'],dat['versione']);
  }

}


createCard(var nome,var descrizione, var thumb, var versione){
  Element col = new Element.tag('div');
  col.className = 'card mb-3';
  col.style.maxWidth = '840px';

  Element divSuprem = new Element.tag('div');
  divSuprem.className = 'col-md-30';

  Element row1 = new Element.tag('div');
  row1.className = 'row g-0';
  Element col2 = new Element.tag('div');
  col2.className = 'col-md-4';
  row1.insertAdjacentElement('afterbegin', col2);
  Element img = new Element.img();
  img.setAttribute('src', 'https://www.syncfusion.com/products/flutter/control/images/chart/chart-types/flutter-line-chart.png');
  img.className = 'img-fluid';
  col2.insertAdjacentElement('afterbegin', img);
  Element col3 = new Element.tag('div');
  col3.className = 'col-md-8';
  Element carb = new Element.tag('div');
  carb.className = 'card-body';
  Element h5 = new Element.tag('h5');
  h5.className = 'card-title';
  h5.text = 'Nome Dataset :'+nome;
  Element p1 = new Element.tag('p');
  p1.className = 'card-text';
  p1.text = 'Descrizione :'+descrizione;
  Element p2 = new Element.tag('p');
  p2.className = 'card-text';
  p2.insertAdjacentHtml('afterbegin', '<small class="text-muted">'+versione+'</small>');
  carb.insertAdjacentElement('afterbegin', p2);
  carb.insertAdjacentElement('afterbegin', p1);
  carb.insertAdjacentElement('afterbegin', h5);
  col3.insertAdjacentElement('afterbegin', carb);
  col.insertAdjacentElement('afterbegin', col3);
  col.insertAdjacentElement('afterbegin', row1);

  divSuprem.insertAdjacentElement('afterbegin', col);
  el.insertAdjacentElement('afterbegin', divSuprem);
}