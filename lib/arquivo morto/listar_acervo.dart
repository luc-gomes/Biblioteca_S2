// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Listar_acervo extends StatefulWidget {
  const Listar_acervo({Key? key}) : super(key: key);

  @override
  _Listar_acervoState createState() => _Listar_acervoState();
}

class _Listar_acervoState extends State<Listar_acervo> {
  // ignore: prefer_typing_uninitialized_variables
  var cafes;

  @override
  void initState() {
    super.initState();

    cafes = FirebaseFirestore.instance.collection('Historias');
    //.where('usuario', isEqualTo: 'joao@gmail.com');
  }

  //
  // Especificar a aparência de cada elemento da List
  //
  exibirItemColecao(item) {
    // função re retorna um listtile
    
    String titulo = item.data()['titulo'];
    String autor = item.data()['autor'];

    return ListTile(
      title: Text(
        titulo,
        style: const TextStyle(fontSize: 24),
      ),
      subtitle: Text(
        autor,
        style: const TextStyle(fontSize: 18),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.ad_units),
                onPressed: () 
                async {
                  Navigator.pushNamed(context, '/POST',
                      arguments: ({"uid": item.id,"titulo_pub": titulo,
                        "autor_pub": autor,"subtitulo_pub": item.data()['subtitulo'],
                        "texto": item.data()['sinopse']}));
                }),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                cafes.doc(item.id).delete();
              },
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/NovaHistoria', arguments: item.id);
      },
    );
  }

//--------------------widget buid----------------------------
  @override
  Widget build(BuildContext context) {
    //var id = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('acervo'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined,color: Colors.orange),
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/menu_opcoes');
            },
          ),
        ],
      ),
      backgroundColor: Colors.brown.shade100,
      body: StreamBuilder<QuerySnapshot>(
          // listas docs coleção
          //fonte de dados (coleção)
          stream: cafes.snapshots(),
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
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.orange.shade900,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/NovaHistoria');
        },
      ),
    );
  }
}
