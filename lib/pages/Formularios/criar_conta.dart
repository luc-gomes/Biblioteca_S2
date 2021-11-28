import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CriarContaPage extends StatefulWidget {
  const CriarContaPage({Key? key}) : super(key: key);

  @override
  _CriarContaPageState createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Bibliotec_S2'),
          centerTitle: true,
          backgroundColor: Colors.green),
      backgroundColor: Colors.green.shade400,
      body: Container(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
            TextField(
              controller: txtNome,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
               decoration: InputDecoration(
                prefixIcon: Icon(Icons.person,
                color: Colors.orange.shade300),
                labelText: 'Nome',
                  focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.yellow.shade600, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                      ),
                      hintText: 'Nome:',
                      hintStyle: TextStyle(color: Colors.amberAccent.shade700),
                    ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: txtEmail,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
               decoration: InputDecoration(
                prefixIcon: Icon(Icons.email,
                color: Colors.orange.shade300),
                labelText: 'Email',
                  focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.yellow.shade600, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                      ),
                      hintText: 'email:',
                      hintStyle: TextStyle(color: Colors.amberAccent.shade700),
                    ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: txtSenha,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
               decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock,
                color: Colors.orange.shade300),
                labelText: 'Senha',
                  focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.yellow.shade600, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                      ),
                      hintText: 'Senha:',
                      hintStyle: TextStyle(color: Colors.amberAccent.shade700),
                    ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: Colors.green,),
                    child: Text('criar',
                          style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.yellow),
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
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade600,),
                    child: Text('cancelar',
                    style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.yellow),
                          textAlign: TextAlign.center,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
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