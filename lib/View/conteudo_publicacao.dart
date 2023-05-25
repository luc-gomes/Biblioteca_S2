import 'package:flutter/material.dart';
import 'dart:core';
class ViewPost extends StatefulWidget {
  const ViewPost({Key? key}) : super(key: key);

  @override
  State<ViewPost> createState() => _ViewPostState();
}
class _ViewPostState extends State<ViewPost> {
  var conteudo;
  @override
  Widget build(BuildContext context) {

    final data = ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>  ; 
    String tituloPub = data['titulo_pub'];
    String subtituloPub = data['subtitulo_pub'];
    String autorPub = data['autor_pub'];
    String texto = data['texto'];
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              child: Column(children: [
                Column(
                  children: [
                    Container(
                      child: Text(
                        tituloPub,
                        style: TextStyle(height: 5, fontSize: 30, color: Colors.black),
                      ),
                    ),
                    Container(
                      child: Text(
                        subtituloPub,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 16, color: Colors.black),
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
                        texto,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 16, color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        border: Border.all(
                          color: const Color.fromARGB(0, 255, 0, 0),
                          width: 7,
                        ),
                      ),
                      child: Text(
                        autorPub,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 16, color: Colors.deepOrangeAccent),
                      ),
                    ),
                  ],
                ),
                Row(
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
      );
    
  }
}
