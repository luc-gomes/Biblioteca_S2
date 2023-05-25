
// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Feed_historias extends StatefulWidget {
  const Feed_historias({ Key? key }) : super(key: key);

  @override
  _Feed_historiasState createState() => _Feed_historiasState();
}

class _Feed_historiasState extends State<Feed_historias> {
  var historias;
  @override
  void initState() {
    super.initState();

    historias = FirebaseFirestore.instance
        .collection('historias');
  }
  exibirItemColecao(item) {
    String titulo = item.data()['titulo'];
    String subtitulo = item.data()['subtitulo'];
    return ListTile(
      title: Text(
        titulo,
        style: const TextStyle(fontSize: 30),
      ),
      subtitle: Text(subtitulo,
        style: const TextStyle(fontSize: 25),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
         historias.doc(item.id).delete();
        },
      ),
      onTap: () {
      Navigator.pushNamed(context, '/NovaHistoria', arguments: item.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acervo'),
        centerTitle: true,
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      backgroundColor: Colors.brown.shade100,
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
        floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/NovaHistoria');
        },
      ),
    );
  }
}
