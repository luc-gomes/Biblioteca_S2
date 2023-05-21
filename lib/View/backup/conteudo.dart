// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore, QuerySnapshot;
import 'package:flutter/material.dart';

class ViewPost extends StatefulWidget {
  const ViewPost({Key? key}) : super(key: key);

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  var conteudo;

@override
  void initState() {
    super.initState();

    conteudo = FirebaseFirestore.instance.collection('Historias');
    //.where('usuario', isEqualTo: 'joao@gmail.com');
  }
  
  exibirItemColecao(item) {
    // função re retorna um listtile
    String titulo = item.data()['titulo'];
    String autor = item.data()['autor'];
    String subtitulo = item.data()['subtitulo'];
    String texto = item.data()['sinopse'];

    return Container(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              child: Column(children: [
                Column(
                  children: [
                    Container(
                      child: Text(
                        titulo,
                        style: TextStyle(height: 5, fontSize: 25),
                      ),
                    ),
                    Container(
                      child: Text(
                        subtitulo,
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
                        autor,
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
                        texto,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
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

//--------------------widget buid----------------------------
  @override
  Widget build(BuildContext context) {
   //var id = ModalRoute.of(context)?.settings.arguments;

     

    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
          // listas docs coleção
          //fonte de dados (coleção)
          stream: conteudo.snapshots(),
          //exibir os dados retornados
          builder: (context, snapshot) {
            //verificar o estado da conexão
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text('Não foi possível conectar ao Firestore'),
                );

              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              //se os dados foram recebidos com sucesso
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
