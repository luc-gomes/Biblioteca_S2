
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class ConstrutorDEhistorias extends StatefulWidget {
  const ConstrutorDEhistorias({ Key? key }) : super(key: key);

  @override
  _ConstrutorDEhistoriasState createState() => _ConstrutorDEhistoriasState();
}

class _ConstrutorDEhistoriasState extends State<ConstrutorDEhistorias> {
  var txtTitulo = TextEditingController();
  var txtSubtitulo = TextEditingController();
  var txtAutor = TextEditingController();
  var txtSinopse = TextEditingController();
  var txtTexto = TextEditingController();
  getDocumentById(id) async {
    await FirebaseFirestore.instance
        .collection('Historias')
        .doc(id)
        .get()
        .then((doc) {
      txtTitulo.text = doc.get('titulo');
      txtTitulo.text = doc.get('subtitulo');
      txtSubtitulo.text = doc.get('texto');
      
    });
  }
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (  
          txtTitulo.text.isEmpty &&
          txtSubtitulo.text.isEmpty &&
          txtTexto.text.isEmpty 
          ) {
        getDocumentById(id);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('tijolometro'),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(children: [
          TextField(
            // TITULO
            controller: txtTitulo,
            style: TextStyle(color: Colors.yellow, fontSize: 36),
            decoration: InputDecoration(
              labelText: 'Titulo',
              labelStyle: TextStyle(color: Colors.yellow, fontSize: 22),
            ),
          ),
          SizedBox(height: 30),
          TextField(
            // SUBTITULO
            controller: txtSubtitulo,
            style: TextStyle(color: Colors.yellow, fontSize: 36),
            decoration: InputDecoration(
              labelText: 'Subtitulo',
              labelStyle: TextStyle(color: Colors.yellow, fontSize: 22),
            ),
          ),
          SizedBox(height: 50),
          TextField(
            // AUTOR
            controller: txtAutor,
            style: TextStyle(color: Colors.yellow, fontSize: 36),
            decoration: InputDecoration(
              labelText: 'Autor',
              labelStyle: TextStyle(color: Colors.yellow, fontSize: 22),
            ),
          ),
          SizedBox(height: 50),
          TextField(
            // SINOPSE
            maxLines: 5,
            maxLength: 100,
            controller: txtSinopse,
            style: TextStyle(color: Colors.yellowAccent, fontSize: 36),
            decoration: InputDecoration(
              labelText: 'Sinopse',
              labelStyle: TextStyle(color: Colors.yellow, fontSize: 22),
            ),
          ),
          SizedBox(height: 50),
          Row(
            // LINHA COM BOTOES DE AÇÃO
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // BOTOES DE AÇÃO
                padding: EdgeInsets.all(5),
                width: 150,
                child: ElevatedButton(
                  child: Text(
                    'Salvar',
                    style: TextStyle(color: Colors.orange),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    if (id == null) {
                      FirebaseFirestore.instance.collection('Historias').add({
                        'autor': txtAutor.text,
                        'sinopse': txtSinopse.text,
                        'subtitulo': txtSubtitulo.text,
                        'titulo': txtTitulo.text,
                      });
                    } else {
                      FirebaseFirestore.instance
                          .collection('testehistoria')
                          .doc(id.toString())
                          .set({
                        'autor': txtAutor.text,
                        'sinopse': txtSinopse.text,
                        'subtitulo': txtSubtitulo.text,
                        'titulo': txtTitulo.text,
                      });
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Operação realizada com sucesso!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 150,
                child: ElevatedButton(
                  //BTN CANCELAR
                  child: Text(
                    'cancelar',
                    style: TextStyle(color: Colors.orange),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
