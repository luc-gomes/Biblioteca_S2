// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Lista_acervo_listview extends StatefulWidget {
  const Lista_acervo_listview({Key? key}) : super(key: key);

  @override
  _Lista_acervo_listviewState createState() => _Lista_acervo_listviewState();
}
class _Lista_acervo_listviewState extends State<Lista_acervo_listview> {
  var historias;
  @override
  void initState() {
    super.initState();
    historias = FirebaseFirestore.instance.collection('Historias');
  }
  exibirItemColecao(item) {
    String titulo = item.data()['titulo'];
    String subtitulo = item.data()['subtitulo'];
    return Container(
       margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(
              color: Colors.black54,
              width: 3,),
              ),
      child: Column(
        children: [
          Container(//TITULO 
          child:  Text(
            titulo,
            style: const TextStyle(fontSize: 30),
          ),),       
          Container(//SUBTITULO
            child: Text(
              subtitulo,
              style: const TextStyle(fontSize: 25),
            ),
          ),
          Container(
             margin: EdgeInsets.all(08.0),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              border: Border.all(
              color: Colors.brown,
              width: 3,
          ),
              ),
            child:Image.asset('lib/Img/Generico/imagem ilustrativa marron.jpg'),
        ),         
      Container(
        margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              border: Border.all(
              color: Colors.orange.shade300,
              width: 1,),
              ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.delete,
              size: 35.0,
              ),
              onPressed: () {
               historias.doc(item.id).delete();
              },
            ),
            IconButton(
              icon: const Icon(Icons.input,
              size: 35.0,
              ),
              onPressed: () async {
                  Navigator.pushNamed(context, '/POST',
                      arguments: ({"uid": item.id,"titulo_pub": titulo,
                        "autor_pub": item.data()['autor'],"subtitulo_pub": item.data()['subtitulo'],
                        "texto": item.data()['sinopse']}));
              },

              
            ),
            IconButton(          
               icon: const Icon(Icons.edit,
               size: 35.0,
               ),            
              onPressed: (){
              Navigator.pushNamed(context, '/NovaHistoria', arguments: item.id);
            },),
          ],
        ),
      ),    
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acervo'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        automaticallyImplyLeading: false,
        actions: [],
      ),
      backgroundColor: Colors.white70,
      body: StreamBuilder<QuerySnapshot>(          
        stream: historias.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text('Não foi possível conectar ao Firestore'),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
                default:
                final dados = snapshot.requireData;
                return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      return exibirItemColecao(dados.docs[index]);
                    });
            }
          }),
    );
  }
}
