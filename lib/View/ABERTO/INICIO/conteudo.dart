
// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:flutter/material.dart';

class ViewPost extends StatefulWidget {
  const ViewPost({Key? key}) : super(key: key);

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  String txtTitulo = 'titulo';
  String txtSubtitulo = 'subtitulo';
  String txtAutor = 'autor';
  String txtSinopse = 'texto';

  getDocumentById(id) async {
    await FirebaseFirestore.instance
        .collection('Historias')
        .doc(id)
        .get()
        .then((doc) {
      txtTitulo = doc.get('titulo');
      txtSubtitulo = doc.get('subtitulo');
      txtAutor = doc.get('autor');
      txtSinopse = doc.get('sinopse');
    });
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (txtTitulo.isEmpty &&
          txtSubtitulo.isEmpty &&
          txtAutor.isEmpty &&
          txtSinopse.isEmpty) {
        getDocumentById(id);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              child: Column(children: [
                Column(
                  children: [
                    Container(
                      child: Text(
                        txtTitulo,
                        style: TextStyle(height: 5, fontSize: 25),
                      ),
                    ),
                    Container(
                      child: Text(
                        txtSubtitulo,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 7,
                        ),
                      ),
                      child: Text(
                        txtSinopse,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  // LINHA COM BOTOES DE AÇÃO
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 202, 77, 61),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  child: Text('voltar'),
                        onPressed: () {
                          Navigator.pop(context);
                        }, 
                        
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
