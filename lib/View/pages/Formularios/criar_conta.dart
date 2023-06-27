import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CriarContaPage extends StatefulWidget {
  const CriarContaPage({Key? key}) : super(key: key);

  @override
  _CriarContaPageState createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {
  var txtNome  = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtNick  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Novo usuário'),
          centerTitle: true,
          backgroundColor: Colors.redAccent),
      backgroundColor: Colors.blueAccent,
      body: Container(
        padding: EdgeInsets.all(22),
        child: ListView(
          children: [
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book_outlined, // INCONE DE CONTA CIRCULAR
                  size: 200,
                  color: Colors.red.shade700)
                  ],
                ),
            
              Column(
              // LOGO E NOME DO APP
                children: [
                Text(
                  'Biblioteca_s2',
                  style: TextStyle(
                  fontSize: 42,
                  fontStyle: FontStyle.normal,                 
                  color: Colors.yellow.shade700),
                  textAlign: TextAlign.center,
                  ),
                ],
              ),
            ]
            ),
            
            

            


            SizedBox(height: 50),
            Column(
               children: [


            TextField(
                  controller: txtEmail,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                   decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email,
                    color: Colors.white),
                    labelText: 'Email',
                      focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white, width: 3.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 1.0),
                          ),
                          hintText: 'email:',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
            ),
            SizedBox(height: 15),
 
            TextField(
                  controller: txtNick,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                   decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,
                    color: Colors.white),
                    labelText: 'Nickname',
                      focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white, width: 3.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 1.0),
                          ),
                          hintText: 'nome de usuario',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
            ),
            SizedBox(height: 15),
      
            TextField(
                  controller: txtNome,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                   decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,
                    color: Colors.white),
                    labelText: 'Nome',
                      focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white, width: 3.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 1.0),
                          ),
                          hintText: 'Nome:',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
            ),
            SizedBox(height: 15),

            TextField(
              obscureText: true,
              controller: txtSenha,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
               decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock,
                color: Colors.white),
                labelText: 'Senha',
                  focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      hintText: 'Senha:',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
            ),
            ],
            ),
            
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent,),
                    child: Text('cancelar',
                    style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.red),
                          textAlign: TextAlign.center,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                 SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red),
                    child: Text('criar',
                          style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.amberAccent),
                          textAlign: TextAlign.center,),
                    onPressed: () {
                      criarConta(
                        txtNome.text,
                        txtEmail.text,
                        txtSenha.text,
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  //
  // CRIAR CONTA no Firebase Auth
  //
  void criarConta(nome, email, senha) {

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((value) {
            exibirMensagem('Usuário criado com sucesso!');
            Navigator.pop(context);
        }).catchError((erro){
          if (erro.code == 'email-already-in-use'){
            exibirMensagem('ERRO: O email informado está em uso.');
          }else if (erro.code == 'invalid-email'){
            exibirMensagem('ERRO: Email inválido.');
          }else{
            exibirMensagem('ERRO: ${erro.message}');
          }
        });

  }

  void exibirMensagem(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }
}