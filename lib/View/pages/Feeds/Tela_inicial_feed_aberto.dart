// ignore_for_file: camel_case_types

/* objetivo: fazer um menu de conta de usuario para mexer em opçoes de visualização e editar informaçoes pessoais da conta*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tela_Inicial_ABERTO extends StatefulWidget {
  const Tela_Inicial_ABERTO({Key? key}) : super(key: key);

  @override
  State<Tela_Inicial_ABERTO> createState() => _Tela_Inicial_ABERTOState();
}

class _Tela_Inicial_ABERTOState extends State<Tela_Inicial_ABERTO> {
  var historias;
   String? codeDialog;
  String? valueText;
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();

    historias = FirebaseFirestore.instance.collection('Historias');
  }

  exibirItemColecao(item, codeDialog) {
    if (codeDialog == null) {
      String titulo = item.data()['titulo'];
      String subtitulo = item.data()['subtitulo'];
      return Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(
            color: Colors.orange.shade300,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              //TITULO

              child: Text(
                titulo,
                style: const TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 236, 205, 64),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Container(
              //SUBTITULO
              child: Text(
                subtitulo,
                style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 236, 205, 64),
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              // imagem
              margin: EdgeInsets.all(50.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                border: Border.all(
                  color: Colors.orange.shade300,
                  width: 18,
                ),
              ),
              child:
                  Image.asset('lib/Img/Generico/imagem ilustrativa marron.jpg'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 ActionChip(
          label: Text('Ler conteúdo'),
          avatar: Icon(Icons.chevron_right),
          backgroundColor: Colors.red.shade700,
          onPressed: () async {
                      Navigator.pushNamed(context, '/POST',
                          arguments: ({
                            "uid": item.id,
                            "titulo_pub": titulo,
                            "autor_pub": item.data()['autor'],
                            "subtitulo_pub": item.data()['subtitulo'],
                            "texto": item.data()['sinopse']
                          }));
                    },
          
        )
             ],
            ),
          ],
        ),
      );
    } else {
      String titulo = item.data()['titulo'].contains(codeDialog);
      String subtitulo = item.data()['subtitulo'];
      return Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            border: Border.all(
              color: Colors.orange.shade300,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Container(
                //TITULO

                child: Text(
                  titulo,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 236, 205, 64),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              Container(
                //SUBTITULO
                child: Text(
                  subtitulo,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 236, 205, 64),
                      fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                // imagem
                margin: EdgeInsets.all(50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(
                    color: Colors.orange.shade300,
                    width: 18,
                  ),
                ),
                child: Image.asset(
                    'lib/Img/Generico/imagem ilustrativa marron.jpg'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 202, 77, 61),
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                      ),
                      onPressed: () async {
                        Navigator.pushNamed(context, '/POST',
                            arguments: ({
                              "uid": item.id,
                              "titulo_pub": titulo,
                              "autor_pub": item.data()['autor'],
                              "subtitulo_pub": item.data()['subtitulo'],
                              "texto": item.data()['sinopse']
                            }));
                      },
                      child: Text('Continuar lendo'))
                ],
              ),
            ],
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Acervo'),
          centerTitle: true,
          backgroundColor: Colors.red,
          automaticallyImplyLeading: true,
          actions: [
            /* IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),*/
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.transparent),
                child: Text(
                  'Biblioteca_S2',
                  style: TextStyle(
                    color: Color.fromARGB(255, 4, 69, 165),
                    fontSize: 24,
                    height: 3.5,
                    letterSpacing: 5,
                    decoration: TextDecoration.overline, //make underline
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 1,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.g_mobiledata),
                title: Text('Entrar Com google'),
                onTap: () => Navigator.pushNamed(context, '/login_improved'),
              ),
              ListTile(
                leading: Icon(Icons.login),
                title: Text('Entrar Com Email'),
                onTap: () => Navigator.pushNamed(context, '/login'),
              ),
              ListTile(
                leading: Icon(Icons.login),
                title: Text('Cadastrar conta'),
                onTap: () => Navigator.pushNamed(context, '/criar_conta'),
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text('Historias'),
                onTap: () => Navigator.pushNamed(context, '/TELA_INICIAL'),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('Sobre'),
                onTap: () => Navigator.pushNamed(context, '/sobre'),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blue.shade900,

        //
        // LISTAR os documentos da COLEÇÃO
        //
        body: StreamBuilder<QuerySnapshot>(
            //fonte de dados (coleção)
            stream: historias.snapshots(),

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
                        return exibirItemColecao(dados.docs[index], codeDialog);
                      });
              }
            }),
        floatingActionButton: FloatingActionButton(
            foregroundColor: Colors.yellow.shade600,
            backgroundColor: Colors.green.shade600,
            child: Icon(Icons.search),
            onPressed: () {
              _displayTextInputDialog(context);
            })

        //-----botão com InsetsController

        );
  }

 
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('O que você procura?'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration:
                  const InputDecoration(hintText: "Digite o que você procura"),
            ),
            actions: <Widget>[
              
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('Deixa pra lá'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('Buscar'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pushNamed(context, '/TELA_INICIAL', arguments: codeDialog );
                  });
                },
              ),
            ],
          );
        });
  }
}
