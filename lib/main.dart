import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/cadastro.dart';
import 'pages/criar_conta.dart';
import 'pages/login.dart';

Future<void> main() async {
  //
  // INICIALIZAR OS Plugins
  //
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/criar_conta': (context) => CriarContaPage(),
        '/principal': (context) => PrincipalPage(),
        '/cadastro': (context) => CadastroPage(),
   
      },
    ),
  );
}

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  //Referenciar a coleção do Firestore
  // ignore: prefer_typing_uninitialized_variables
  var cafes;

  @override
  void initState() {
    super.initState();

    cafes = FirebaseFirestore.instance
        .collection('cafes')
        .where('usuario', isEqualTo: 'joao@gmail.com');
  }

  //
  // Especificar a aparência de cada elemento da List
  //
  exibirItemColecao(item) {
    String nome = item.data()['nome'];
    String preco = item.data()['preco'];

    return ListTile(
      title: Text(
        nome,
        style: const TextStyle(fontSize: 30),
      ),
      subtitle: Text(
        'R\$ $preco',
        style: const TextStyle(fontSize: 25),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          //
          // APAGAR um documento
          //
          cafes.doc(item.id).delete();
        },
      ),
      onTap: () {
        Navigator.pushNamed(context, '/cadastro', arguments: item.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Café Store'),
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

      //
      // LISTAR os documentos da COLEÇÃO
      //
      body: StreamBuilder<QuerySnapshot>(
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
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/cadastro');
        },
      ),
    );
  }
}
